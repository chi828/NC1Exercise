//
//  ContentView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let allQnAs = QnAViewModel().qAndAs
    
    @State var progress: Float = 0
    @State var heartCounter: Int = 0
    
    @State var dialog = "Aiuto"
    
    @State var currentQnA = QnAViewModel().qAndAs[4]
    @State var words = QnAViewModel().qAndAs[4].generateWords().shuffled()
    
    @State var correctlyAnswered: Bool = true
    @State var emptyAnswer = false
    @State var checked = false
    @State var composeSolution: [Binding<Word>] = []
    
    @State var mood: Mood = .normal
    
    var layout = WrappingHorizontalLayout()
    
    func isSameWord(toDelete: Word, thisId: UUID) -> Bool {
        return toDelete.id == thisId
    }
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                //Settings, progress and heart
                HStack {
                    
                    Button(action: {}, label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.gray)
                    })
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("Settings")
                    ProgressView(value: progress)
                        .tint(.green)
                        .progressViewStyle(.linear)
                    
                    
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                    Text("\(heartCounter)").bold().foregroundStyle(.red)
                    
                }
                
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
                        }
                        .buttonStyle(.borderedProminent)
                }
                .padding([.top], 30)
                .frame(minHeight: 100)
                //The "palette" of words to compose the solution
                layout {
                    
                    ForEach($words) { $word in
                        ZStack {
                            
                            
                            Button(word.word) {
                                composeSolution.append($word)
                                
                                word.selected.toggle()
                                //                    print(word.selected)
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(word.selected)
                        }
                    }
                    

                    
                    
                }
                .disabled(checked)
                .frame(maxHeight: .infinity)
                
                
                Button("Check") {
                    var finalAnswer = ""
                    for word in composeSolution {
                        finalAnswer.append(word.wrappedValue.word + " ")
                    }
                    finalAnswer = finalAnswer.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    correctlyAnswered = currentQnA.answer == finalAnswer
                    print(correctlyAnswered)
                    checked.toggle()
                    mood = correctlyAnswered ? .happy : .sad
                    progress = correctlyAnswered ? progress + 0.1 : progress - 0.1
                }
                .disabled(checked)
            

                
                
                //Check/Continue button
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
                    composeSolution.removeAll()
                }, label: {
                    Text("CONTINUE")
                    
                        .padding(2)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .bold()
                })
                .disabled(!checked)
                .buttonStyle(.bordered)
                
                
                
                
            }
            .padding()
            .tint(.green)
            .disabled(emptyAnswer)
        }
    }
}

#Preview {
    ContentView()
}
