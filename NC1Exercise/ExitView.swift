//
//  ExitView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 22/11/23.
//

import SwiftUI

struct ExitView: View {
    
    @Environment (\.dismiss) var dismiss
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        
        Image("bouncy_sad0")
            .resizable()
            .scaledToFit()
        
            Text("You shall not run away.")
            .font(.title2)
                .bold()
                .padding(.top)
        
        Text("You'll make Federica sad. You don't want to make Federica sad. Trust me.")
            .padding(1)
            .padding([.horizontal])
            .padding(.bottom, 10)
            .foregroundStyle(.opacity(0.7))
        
        Button {
            dismiss()
        } label: {
            Text("Keep learning")
            
            .frame(maxWidth: .infinity)
            .padding(2)
        }
        .padding()
        .buttonStyle(.borderedProminent)
        .tint(.cyan)
        Button {
            dismiss()
        } label: {
            Text("Keep learning but red")
                .frame(maxWidth: .infinity)
                .padding(2)
        }
        .tint(.red)
    }
}

#Preview {
    ExitView()
}
