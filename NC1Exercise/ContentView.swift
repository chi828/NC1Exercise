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
    @State var emptyAnswer = false
    
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
                    QuestionView()
                }
                Rectangle()
                Button(action: {
                    
                    var progress: Float = 0.5
                    var prova = 1..<20
                    @State var emptyAnswer = false
                    
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
                                    QuestionView()
                                }
                                Rectangle()
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("CHECK")
                                        .padding(2)
                                        .frame(maxWidth: .infinity)
                                    //                        .foregroundStyle(emptyAnswer ? .white.opacity(0.5) : .white)
                                        .font(.headline)
                                        .bold()
                                })
                                .buttonStyle(.bordered)
                                
                            }
                            .padding()
                            .tint(.green)
                            .disabled(emptyAnswer)
                        }
                    }
                }, label: {
                    Text("CHECK")
                        .padding(2)
                        .frame(maxWidth: .infinity)
                    //                        .foregroundStyle(emptyAnswer ? .white.opacity(0.5) : .white)
                        .font(.headline)
                        .bold()
                })
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
