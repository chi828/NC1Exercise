//
//  ContentView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let allQnAs = QnAViewModel().qAndAs
    
    @State var progress: Float = 0.1
    @State var heartCounter: Int = 0
    
    @State var dialog = "Aiuto"
    
    @State var currentQnA = QnAViewModel().qAndAs[0]
    @State var words = QnAViewModel().qAndAs[0].generateWords().shuffled()
    
    @State var correctlyAnswered: Bool = false
    @State var emptyAnswer = false
    @State var checked = false
    @State var composeSolution: [Binding<Word>] = []
    
    @State var mood: Mood = .normal
    @State var showExitModal: Bool = false
    
    var layout = WrappingHorizontalLayout()
    
    func isSameWord(toDelete: Word, thisId: UUID) -> Bool {
        return toDelete.id == thisId
    }
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                //Settings, progress and heart
                HStack {
                    
                    Button(action: { showExitModal.toggle() }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.gray)
                    })
                    .accessibilityLabel("Settings")
                    ProgressView(value: progress)
                        .tint(.green)
                        .progressViewStyle(.linear)
                    
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                    Text("\(heartCounter)").bold().foregroundStyle(.red)
                    
                }
                
                .bold()
                .font(.title2)
                
                Text("Tanslate this sentence")
                    .font(.title2)
                    .bold()
                
                
                //Character and question
                HStack {
                    Character(mood: $mood)
                        .scaledToFit()
                    
                    
                    QuestionView(dialog: currentQnA.question)
                }
                
                .padding([.top], 30)
                
                
                //Exercise kinda
                //The sentence composed by the user
                
                layout {
                    ForEach(composeSolution) { $word in
                        Button(word.word) {
                            word.selected.toggle()
                            composeSolution.removeAll(where: {word.id == $0.id})
                        }
                        .accessibilityLabel(word.word)
                    }
                    .buttonStyle(WordButtonStyle2())
                    .disabled(checked)
                }
                .padding([.top], 30)
                .frame(minHeight: 100)
                //The "palette" of words to compose the solution
                layout {
                    
                    ForEach($words) { $word in
                        
                        Button(word.word) {
                            composeSolution.append($word)
                            
                            word.selected.toggle()
                        }
                        .sensoryFeedback(.selection, trigger: word.selected)
                        .buttonStyle(WordButtonStyle())
                        .disabled(word.selected)
                        
                        .accessibilityLabel(word.word)
                    }
                    
                    
                    
                    
                }
                .disabled(checked)
                .frame(maxHeight: .infinity)
                
                
                Button {
                    var finalAnswer = ""
                    for word in composeSolution {
                        finalAnswer.append(word.wrappedValue.word + " ")
                    }
                    finalAnswer = finalAnswer.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    correctlyAnswered = currentQnA.answer == finalAnswer
                    checked.toggle()
                    mood = correctlyAnswered ? .happy : .sad
                    progress = correctlyAnswered ? progress + 0.1 : progress - 0.1
                } label: {
                    Text("Check")
                        .frame(maxWidth: .infinity)
                        .sensoryFeedback(.success, trigger: correctlyAnswered)
                }
                .disabled(checked || composeSolution.isEmpty)
                .accessibilityLabel("Check if answer is correct")
                
                
                
                
                //CContinue button
                Button(action: {
                    if progress >= 1 {
                        progress = 0
                        heartCounter += 1
                    } else if progress <= 0 {
                        heartCounter -= 1
                        progress = 0
                    }
                    currentQnA = allQnAs.randomElement()!
                    words = currentQnA.generateWords().shuffled()
                    dialog = currentQnA.question
                    mood = .normal
                    checked.toggle()
                    correctlyAnswered = false
                    composeSolution.removeAll()
                }, label: {
                    Text("CONTINUE")
                    
                        .padding(2)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .bold()
                        .accessibilityHint("Go to next question")
                })
                .disabled(!checked)
                .buttonStyle(.bordered)
                
                
                
                
            }
            .padding()
            .tint(.green)
            .disabled(emptyAnswer)
        }
        .sheet(isPresented: $showExitModal) {
            ExitView()
            
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
}
