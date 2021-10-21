//
//  SearchTableViewController.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/11/21.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating{
    
    weak var delegate :definitionDetailsParent?
    
    var word:Word?
    var results:[WordInstance]?
    
    var resultSearchController = UISearchController()
    var searchTask:DispatchWorkItem?
    
    //MARK: Initializers
    
     init(delegate:definitionDetailsParent){
         self.delegate = delegate
         super.init(nibName: nil, bundle: nil)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        results?.removeAll()
        tableView.reloadData()
        
        guard let textToSearch = resultSearchController.searchBar.text, !textToSearch.isEmpty else {
            return
        }
        self.searchTask?.cancel()
        
        let task = DispatchWorkItem{
            Networking.shared.getWordData(searchWord: textToSearch){[weak self] aResult in
                switch aResult{
                case .success(let aWord):
                    self?.word = aWord
                    self?.results = aWord.results
                    DispatchQueue.main.async{ 
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    //if failure, flush last results
                    self?.word = nil
                    self?.results = nil
                    print(error.localizedDescription)
                } //switch result
            } //networking.shared
        }
        self.searchTask = task
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.75, execute: task)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DefinitionCell.self, forCellReuseIdentifier: "DefinitionCell")
       
        resultSearchController.delegate = self
        resultSearchController.searchBar.delegate = self
        navigationItem.searchController = resultSearchController
        
        resultSearchController.searchResultsUpdater = self
        resultSearchController.dimsBackgroundDuringPresentation = false
       
        Networking.shared.getWordData(searchWord: "happy"){[weak self] aResult in
            switch aResult{
            case .success(let aWord):
                 self?.word = aWord
                 self?.results = aWord.results
                 DispatchQueue.main.async{
                     self?.tableView.reloadData()
                 }
                 
            case .failure(let error):
                print(error.localizedDescription)
                //if failure, word and results are nil
            }
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return word?.results?.count ?? 0
        return results?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
       guard let word = word,let results = word.results else {return}
    //    guard let word = word,let results = results else {return}
      //  guard let results = results else {return}
        let selectedInstance = results[indexPath.row]
        /*
        if let definitionVC = DefinitionDetailController(wordInstance:selectedInstance) as? DefinitionDetailController {
            self.present(definitionVC, animated: true)
        }
       */
        delegate?.launchDetailDefinitionVC(wordInstance:selectedInstance)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as? DefinitionCell else {
              return UITableViewCell()
        }
        cell.wordLabel.text = word?.word
        print("assigning wordLabel to \(word?.word)")
        let definition = word?.results?[indexPath.row].definition
        print("assigning definition label to \(definition)")
        cell.definitionLabel.text = definition
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
