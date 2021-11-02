//
//  BottomViewController.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/16/21.
//

import UIKit

class BottomViewController: UIViewController {
    
    var topViewController: TopViewController!
    
    let headers = [
        "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
        "x-rapidapi-key": ""
    ]
    var selectedWord: String?
    var selectedWordResults: [WordDetails]?
    
    var bottomView: BottomView!
    
    override func loadView() {
        
        bottomView = BottomView(buttonAction: { [weak self] in
            self?.fetchDefinitions{ wordData, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async { [weak self] in
                    let resultsThatIncludeADefinition = wordData?.results?.filter { $0.definition != nil }
                    self?.selectedWordResults = resultsThatIncludeADefinition
                    self?.selectedWord = wordData?.word
                    self?.selectedWordResults = wordData?.results

                    self?.bottomView.tableView.reloadData()
                }
            }
        })
        
        bottomView.tableView.dataSource = self
        bottomView.tableView.delegate = self
        
        bottomView.searchTextField.delegate = self

        view = bottomView
    
    }
    
    func fetchDefinitions(completion: @escaping (Word?, Error?) -> Void) {
        let newWord = bottomView.searchTextField.text!
        if newWord.isEmpty {presentMissingWordAlert()}
        
        guard let newWordURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(newWord)") else {
            print("Invalid URL")
            return
        }

        var urlRequest = URLRequest(url: newWordURL,
                         cachePolicy: .useProtocolCachePolicy,
                         timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let decodedWord = try JSONDecoder().decode(Word.self, from: data)
                print(decodedWord)
                completion(decodedWord, error)
            }
            catch {
                print("Failed to decode word \(error.localizedDescription)")
                completion(nil, error)
            }
        }.resume()
        
        func presentMissingWordAlert() {
            let alertController = UIAlertController(title: "", message: "Please enter a word to retrieve definitions", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}


extension BottomViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedWordResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let selectedWord = selectedWord,
              let resultOfSelectedWord = selectedWordResults?[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsTableViewCell", for: indexPath) as? SearchResultsTableViewCell else {
                  return UITableViewCell()
        }
        cell.update(newWord: selectedWord, results: resultOfSelectedWord)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedWord = selectedWord,
              let selectedWordResults = selectedWordResults?[indexPath.row]
                else {
            assertionFailure("Selected word unexpectedly found nil")
            return
        }
        
        navigationController?.pushViewController(WordDetailsViewController(selectedWord: selectedWord, wordDetails: selectedWordResults), animated: true)    }
}

extension BottomViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
