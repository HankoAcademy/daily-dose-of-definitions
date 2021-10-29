//
//  Word.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/27/21.
//

import Foundation

struct Word: Codable {
    let word: String?
    let results: [WordDetails]?
    
    enum CodingKeys: String, CodingKey {
        case word, results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.word = try container.decode(String.self, forKey: .word)
        self.results = try container.decodeIfPresent([WordDetails].self, forKey: .results)
    }
}

struct WordDetails: Codable {
    
    let definition: String?
    let partOfSpeech: String?
    let synonyms: [String]?
    let antonyms: [String]?
    let examples: [String]?

    
//    enum CodingKeys: String, CodingKey {
//        case definition, partOfSpeech
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.definition = try container.decodeIfPresent(String.self, forKey: .definition)
//        self.partOfSpeech = try container.decodeIfPresent(String.self, forKey: .partOfSpeech)
//        self.synonyms = try container.decodeIfPresent(String.self, forKey: .synonyms)
//        self.antonyms = try container.decodeIfPresent(String.self, forKey: .antonyms)
//        self.examples = try container.decodeIfPresent(String.self, forKey: .examples)
//    }
}
