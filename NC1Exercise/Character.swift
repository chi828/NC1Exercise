//
//  Character.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 19/11/23.
//

import Foundation
import SwiftUI

enum Mood: String {
    case normal, happy, sad
}

struct Character: View {
//    let normalImages: [Image]
//    let happyImages: [Image]
//    let sadImages: [Image]
    
    let framecount = 40
    let blinkLength = 6
    @Binding var mood: Mood
    @State private var currentFrame: Int = 0
    @State private var pallina: String = "bouncy_normal0"
    
    
    var body: some View {
        GeometryReader { geometry in
            Image(pallina)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onAppear() {
                    
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0 / 9.0, repeats: true) {timer in
                        if currentFrame < blinkLength {
                            pallina = "bouncy_\(mood)\(currentFrame)"
                        } else {
                            pallina = "bouncy_\(mood)0"
                        }
                        currentFrame = (currentFrame + 1) % framecount
                    }
                }
        }
    }
    
}

#Preview {
    Character(mood: .constant(.sad))
}
