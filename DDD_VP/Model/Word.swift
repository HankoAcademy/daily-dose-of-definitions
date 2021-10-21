//
//  Word.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/9/21.
//

import Foundation

struct WordInstance:Codable{
    let definition:String
    let partOfSpeech:String?
    let synonyms:[String]?
    let antonyms:[String]?
    let typeOf:[String]?
    let examples:[String]?
    let similarTo, derivation, usageOf: [String]?
}
struct Syllables: Codable {
    let count: Int
    let list: [String]
}
struct Pronunciation: Codable {
    let all: String
}
struct Word:Codable{
    let word: String
    let results: [WordInstance]?
    let syllables: Syllables?
    let pronunciation: Pronunciation?
    let frequency: Double?
}
