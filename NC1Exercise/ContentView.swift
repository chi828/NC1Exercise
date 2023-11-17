//
//  ContentView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var progress: Float = 0.5
    var prova = 1..<20
    
    @State var dialog = "Aiuto"
    
    @State var happy: Bool = true
    @State var emptyAnswer = false
    @State var checked = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                //Progress and Settings
                HStack {

                    Button(action: {}, label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.gray)
                    })
                    ProgressView(value: progress)
                        .tint(.green)
                        .progressViewStyle(.linear)
                    
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                    
                }
                
                
                
                HStack {
                    Image("Character_placeHolder")
                        .resizable()
                        .scaledToFit()
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    QuestionView(dialog: dialog)
                }
              
                Toggle(isOn: $happy,  label: {
                    Text(happy ? "Uiiii" : "AHHHHH")
                })
                .toggleStyle(.button)
                .tint(happy ? .green : .red)
                .frame(maxHeight: .infinity)
                .disabled(checked)
                
                
//                if checked {
//                    Button(action: {
//                        checked.toggle()
//                    }, label: {
//                        Text("CONTINUE")
//                            .padding(2)
//                            .frame(maxWidth: .infinity)
//                        //                        .foregroundStyle(emptyAnswer ? .white.opacity(0.5) : .white)
//                            .font(.headline)
//                            .bold()
//                            .buttonStyle(.bordered)
//                    })
//                } else {
                    Button(action: {
                        if checked {
                            dialog = "Aiuto"
                        } else {
                            dialog = happy ? "Yaayyyy!" : "No.. no... NOOOOOO"
                        }
                        
                            checked.toggle()
                    }, label: {
                        Text(checked ? "CONTINUE" : "CHECK")

                            .padding(2)
                            .frame(maxWidth: .infinity)
                        //                        .foregroundStyle(emptyAnswer ? .white.opacity(0.5) : .white)
                            .font(.headline)
                            .bold()
                    })
                    .buttonStyle(.bordered)
//                }
                

                
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
