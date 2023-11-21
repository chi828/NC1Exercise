//
//  WrappingHorizontalView.swift
//  NC1Exercise
//
//  Created by Chiara Giorgia Ricci on 21/11/23.
//

import SwiftUI

struct WrappingHorizontalLayoutCentered: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var nextPoint: CGPoint = bounds.origin
        var rowHeight: CGFloat = 0
        var rowWidth: CGFloat = 0
        var row: [LayoutSubview] = []
        
        for subview in subviews {
            
            let height = subview.sizeThatFits(proposal).height
            let width = subview.sizeThatFits(proposal).width
            
            if rowWidth + width > bounds.maxX {//Se la riga non riesce a contenere il prossimo elemento
                //la riga non riceverà altri elementi: possiamo piazzarla
                
                for element in row {
                    element.place(at: nextPoint, proposal: proposal)
                    nextPoint.x += element.sizeThatFits(proposal).width + 10
                }
                
                //Riazzeriamo la riga per fare spazio per la prossima
                row.removeAll()
                rowWidth = 0
                rowHeight = 0
                
                //Portiamo a capo il punto
                nextPoint.x = bounds.minX
                nextPoint.y = nextPoint.y + rowHeight + 10
            }
            rowWidth += width + 10
            if height > rowHeight {
                rowHeight = height
            }
        }
        
        for element in row {
            element.place(at: nextPoint, proposal: proposal)
            nextPoint.x += element.sizeThatFits(proposal).width + 10
        }
    }
    
    
}

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
                nextPoint.y = nextPoint.y + rowHeight + 10
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
            ForEach(0 ..< 20) { _ in
                Rectangle()
                    .frame(width: 10, height: 30)
                Rectangle()
                    .frame(width: 50, height: 20)
                Circle()
                    .frame(height: 50)
            }
            
        }
    }
}

#Preview {
    PreView()
}
