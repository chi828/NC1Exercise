//
//  WrappingHorizontalView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 21/11/23.
//

import SwiftUI

struct WrappingHorizontalLayout: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()) -> CGSize {
            return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        var nextPoint: CGPoint = bounds.origin
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            
            let height = subview.sizeThatFits(proposal).height
            let width = subview.sizeThatFits(proposal).width
            
            if nextPoint.x + width > bounds.maxX {
                nextPoint.x = bounds.minX
                nextPoint.y = nextPoint.y + rowHeight + 5
            }
            if height > rowHeight {
                rowHeight = height
            }
            
            subview.place(at: nextPoint, proposal: proposal)
            
            nextPoint.x += width + 10
            
            
        }
    }
    
    
}


struct WrappingHorizontalView<Content: View>: View {
    @State var layout: AnyLayout
    @State var content: () -> Content
    
    init(
         @ViewBuilder content: @escaping () -> Content
    )
    {
        self.layout = AnyLayout(WrappingHorizontalLayout())
        self.content = content
    }
    
    var body: some View {
        layout {
            content()
        }
    }
}

struct PreView: View {
    
    var body: some View {
        WrappingHorizontalView {
            Rectangle()
                .frame(width: 10, height: 30)
            Rectangle()
                .frame(width: 50, height: 20)
        }
    }
}

#Preview {
    PreView()
}
