//
//  AnswerView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 17/11/23.
//

import SwiftUI

struct AnswerView: View {
    
    @State var yes: Binding<Bool>
    
    var body: some View {
        Toggle(isOn: yes,  label: {
            Text(yes.wrappedValue ? "Uiiii" : "AHHHHH")
        })
        .toggleStyle(.button)
        .tint(yes.wrappedValue ? .green : .red)
    }
}

#Preview {
    AnswerView(yes: .constant(true))
}
