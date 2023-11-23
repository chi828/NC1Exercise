//
//  WordButtonStyle.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 22/11/23.
//

import Foundation
import SwiftUI

struct WordButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundStyle(.background.opacity(isEnabled ? configuration.isPressed ? 0.6 : 1 : 0))
            .background(isEnabled ? .green : .gray)
            .clipShape(RoundedRectangle(cornerRadius: 15.0), style: FillStyle())
    }
}

struct WordButtonStyle2: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundStyle(.background.opacity(configuration.isPressed ? 0.6 : 1))
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 15.0), style: FillStyle())
    }
}

struct HoSonno: View {
    var body: some View {
        Button("Uffa Però") {
            print("No ma davvero uffa \(Date())")
        }
        .buttonStyle(WordButtonStyle())
        
    }
}

#Preview {
    HoSonno()
}
