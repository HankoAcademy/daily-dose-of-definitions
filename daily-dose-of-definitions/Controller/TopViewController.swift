//
//  TopViewController.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/16/21.
//

import UIKit
import Alamofire

protocol RandomWordGeneratable: AnyObject {
    func generateRandomWordToDisplay()
}

class TopViewController: UIViewController {

    var topView: TopView!
    var randomWord: Word!

    override func loadView() {

        topView = TopView(buttonAction: { [weak self] in
            self?.fetchNewRandomWord{ wordData, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async { [weak self] in
                    self?.topView?.randomWordLabel.text = wordData?.word
                    self?.topView?.randomWordLabel.text = self?.topView?.randomWordLabel.text?.localizedCapitalized
                    self?.topView?.definitionLabel.text = wordData?.results?.first?.definition
                    if self?.topView?.definitionLabel.text == nil {
                        self?.topView?.definitionLabel.text = "definition not available yet"
                    }
                    self?.topView?.partOfSpeechLabel.text = wordData?.results?.first?.partOfSpeech
                    
                    self?.topView.spinner.stopAnimating()
                }
            }
        })
        view = topView
    
    }

    func fetchNewRandomWord(completion: @escaping (Word?, Error?) -> Void) {
        
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key": ""
        ]
        
        topView.spinner.startAnimating()
        
        AF.request("https://wordsapiv1.p.rapidapi.com/words/?random=true", method: .get, headers: headers).responseDecodable(of: Word.self) { response in

            if let error = response.error {
                completion(nil, error)
                print(error.localizedDescription)
            }

            self.randomWord = response.value
            completion(self.randomWord, nil)
        }
        
            
//        MARK: - Traditional URL Session Request
//        guard let newWordURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true") else {
//            print("Invalid URL")
//            return
//        }
//
//        let headers = [
//            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
//            "x-rapidapi-key": "ec2d98353dmshe451ea49fea8d97p1026a6jsn7cf62ffe7212"
//        ]
//
//        var urlRequest = URLRequest(url: newWordURL,
//                         cachePolicy: .useProtocolCachePolicy,
//                         timeoutInterval: 10.0)
//        urlRequest.httpMethod = "GET"
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.allHTTPHeaderFields = headers
//
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(nil, error)
//                return
//            }
//            do {
//                self.randomWord = try JSONDecoder().decode(Word.self, from: data)
//                print(self.randomWord!)
//                completion(self.randomWord, error)
//            }
//            catch {
//                print("Failed to convert \(error.localizedDescription)")
//                completion(nil, error)
//            }
//        }.resume()

    }
}
