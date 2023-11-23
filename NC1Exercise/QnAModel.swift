//
//  QnAModel.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 20/11/23.
//

import Foundation

struct Word: Identifiable {
    var id = UUID()
    var word: String
    var selected: Bool = false
}

struct QnA {
    public let question: String
    public let answer: String
    
    func generateWords() -> [Word] {
        var result: [Word] = []
        
        let answer = self.answer.components(separatedBy: " ")
        
        for (word) in answer {
            result.append(Word(word: word))
        }
        
        return result
    }
    
}
