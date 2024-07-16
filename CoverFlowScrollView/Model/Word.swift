//
//  Word.swift
//  CoverFlowScrollView
//
//  Created by Paul Patterson on 10/07/2024.
//

import Foundation

struct Word: Identifiable {
    
    let id = UUID()
    var word: String
    var definition: String
    
    init(_ word: String, definition: String) {
        self.word = word
        self.definition = definition
    }
    
}
