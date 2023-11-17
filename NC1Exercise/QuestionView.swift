//
//  QuestionView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 17/11/23.
//

import SwiftUI

struct QuestionView: View {
    
    var controlPoint: Float = 0.0
    
    @State var check = true
    
    var color: Color {
        switch check {
        case true:
            return .green
        case false:
            return .red
        }
    }
    
    var body: some View {
    
        ZStack {
            SpeechBubble()
                .stroke(.gray, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .fill(.white)
            .frame(width: 220, height: 100)
            Text("Aiuto")
        }
        
    }
}

#Preview {
    QuestionView()
}
