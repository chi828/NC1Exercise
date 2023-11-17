//
//  WordBlockView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 20/11/23.
//

import Foundation
import SwiftUI

struct WordBlockView: View {
    
    var word: Word
    let wordSelectionAction: ()->Void
    @Binding var disabled: Bool
    
    var body: some View {
//        Text(word.word)
//            .padding(6)
//            .overlay {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(lineWidth: 2.0)
//                    .foregroundStyle(.gray)
//            }
        
        Button(word.word) {
            wordSelectionAction()
            disabled = true
        }
        .buttonStyle(.borderedProminent)
        .disabled(disabled)
    }
}

#Preview {
    
    WordBlockView(word: Word(word: "Aiutatemi"), wordSelectionAction: {}, disabled: .constant(true))
}
