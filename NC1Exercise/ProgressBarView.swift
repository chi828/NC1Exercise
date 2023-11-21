//
//  ProgressBarView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 22/11/23.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var progress: CGFloat
    var height: CGFloat = 25
    var width: CGFloat = 350
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            Capsule().frame(width: width, height: height)
                .foregroundStyle(.gray)
                .opacity(0.4)
            Capsule().frame(width: progress*width, height: height)
                    .foregroundStyle(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
        }
        
    }
}

#Preview {
    ProgressBarView(progress: .constant(0.8))
}
