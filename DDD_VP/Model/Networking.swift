//
//  Networking.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/9/21.
//
enum NetworkError:Error{
    case badURL
    case transportError(Error)
    case missingData
    case serverError(statusCode:Int)
    case decodingError
}
import Foundation

let baseUrlString = "https://wordsapiv1.p.rapidapi.com/words"
let randomString = "\(baseUrlString)/?random=true"

class Networking{
    static let shared = Networking()
    private init(){}
    
    func getWordData(searchWord:String,completion:@escaping(Result<Word,NetworkError>) ->()){
        
        let headers = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key" : APIKey
        ]
        
        let requestString = "\(baseUrlString)/\(searchWord)"
        guard let usersURL = URL(string: requestString) else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url:usersURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error{
                print(error)
                completion(.failure(.transportError(error)))
            }
            if let httpResponse = response as? HTTPURLResponse,
               !(200..<300).contains(httpResponse.statusCode){
                completion(.failure(.serverError(statusCode:httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.missingData))
                return
            }
            print( String(data:data, encoding:.utf8)!)
            let decoder = JSONDecoder()
            guard let word = try? decoder.decode(Word.self, from:data) else {
                print("failed to retrieve searched word")
                completion(.failure(.decodingError))
                return
            }
            completion(.success(word))
        }
        dataTask.resume()
    }
    
    func getRandomWord(completion:@escaping(Result<Word,NetworkError>) ->()){
       
        let headers = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key" : APIKey
        ]
        
        let requestString = randomString
        guard let usersURL = URL(string: requestString) else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url:usersURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error)
                completion(.failure(.transportError(error)))
            }
            if let httpResponse = response as? HTTPURLResponse,
               !(200..<300).contains(httpResponse.statusCode){
                completion(.failure(.serverError(statusCode:httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.missingData))
                return
            }
            print( String(data:data, encoding:.utf8)!)
            let decoder = JSONDecoder()
            guard let word = try? decoder.decode(Word.self, from:data) else {
                print("failed to retrieve searched word")
                completion(.failure(.decodingError))
                return
            } //word try
            completion(.success(word))
        }
        dataTask.resume()
  }

 }
