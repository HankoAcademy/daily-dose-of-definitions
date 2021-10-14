//
//  RandomWordViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/2/21.
//

import UIKit

protocol RandomWordGeneratable: AnyObject {
    func generateRandomWordToDisplay()
}

class RandomWordViewController: UIViewController {
    
    // MARK: - UI Properties
    
    lazy var randomWordView = RandomWordView(randomWordGeneratableDelegate: self)
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        view = randomWordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let randomWordDataURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true&hasDetails=definitions") else {
            return
        }
        
        let headers = [
            "x-rapidapi-key": "yourAPIKey",
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: randomWordDataURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            do {
                let randomWord = try JSONDecoder().decode(Word.self, from: data)
                print(randomWord)
                DispatchQueue.main.async { [weak self] in
                    self?.randomWordView.titleLabel.text = randomWord.word
                    self?.randomWordView.descriptionLabel.text = randomWord.results?.first?.definition
                    self?.randomWordView.partsOfSpeechLabel.text = randomWord.results?.first?.partOfSpeech
                }
            }
            catch {
                print("Failed to decode WordDetails with error: \(error.localizedDescription)")
                DispatchQueue.main.async { [weak self] in
                    self?.randomWordView.titleLabel.text = ""
                    self?.randomWordView.descriptionLabel.text = "Could not find a random word. \nTap on the bottom right refresh button for a new word."
                    self?.randomWordView.partsOfSpeechLabel.text = ""
                }
            }
        }.resume()
    }
}

// MARK: - RandomWordGeneratable Delegate Methods

extension RandomWordViewController: RandomWordGeneratable {
    
    func generateRandomWordToDisplay() {
        guard let randomWordDataURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true&hasDetails=definitions") else { return }
        
        let headers = [
            "x-rapidapi-key": "yourAPIKey",
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: randomWordDataURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            do {
                let randomWord = try JSONDecoder().decode(Word.self, from: data)
                print(randomWord)
                DispatchQueue.main.async { [weak self] in
                    self?.randomWordView.titleLabel.text = randomWord.word
                    self?.randomWordView.descriptionLabel.text = randomWord.results?.first?.definition
                    self?.randomWordView.partsOfSpeechLabel.text = randomWord.results?.first?.partOfSpeech
                }
            }
            catch {
                print("Failed to decode Word with error: \(error.localizedDescription)")
                DispatchQueue.main.async { [weak self] in
                    self?.randomWordView.titleLabel.text = ""
                    self?.randomWordView.descriptionLabel.text = "Could not find a random word. \nTap on the bottom right refresh button for a new word."
                    self?.randomWordView.partsOfSpeechLabel.text = ""
                }
            }
        }.resume()
    }
}
