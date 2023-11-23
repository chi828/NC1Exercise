//
//  AnswerView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 17/11/23.
//

import SwiftUI

struct AnswerView: View {
    let currentQnA: QnA
    @Binding var correctlyAnswered: Bool
    @State var words: [Word]
    @State var selectedText: String = ""
    
    @State var selected = false
    @Binding var checked: Bool
    @Binding var mood: Mood
    @Binding var progress: Float
    
    
    func reset() {
        selectedText = ""
    }
    
    
    var body: some View {
        
        var composeSolution: [Word] = []
        //The sentence composed by the user
        Text(selectedText)
        
        
        //The "palette" of words to compose the solution
        HStack {
            
            ForEach(composeSolution) { word in
                Button(word.word) {
                    
                }
            }
            
            ForEach($words) { $word in
                ZStack {
                    
                    
                    Button(word.word) {
                        selectedText.append(word.word + " ")
                        //wordSelected[index] = true
                        composeSolution.append(word)
                        
                        word.selected.toggle()
                        //                    print(word.selected)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(word.selected)
                }
            }
            

            
            
        }
        
        
        Button("Check") {
            let finalAnswer = selectedText.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            correctlyAnswered = currentQnA.answer == finalAnswer
            print(correctlyAnswered)
            selectedText = ""
            checked.toggle()
            mood = correctlyAnswered ? .happy : .sad
            progress = correctlyAnswered ? progress + 0.1 : progress - 0.1
        }
        .disabled(checked)
    }
}
    

#Preview {
    AnswerView(currentQnA: QnAViewModel().qAndAs[0], correctlyAnswered: .constant(true), words: QnAViewModel().qAndAs[0].generateWords().shuffled(), checked: .constant(false), mood: .constant(.normal), progress: .constant(0.5))
}
