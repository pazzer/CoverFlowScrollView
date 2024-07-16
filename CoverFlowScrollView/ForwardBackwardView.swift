//
//  ForwardBackwardView.swift
//  CoverFlowScrollView
//
//  Created by Paul Patterson on 16/07/2024.
//

import SwiftUI


struct ForwardBackwardView: View {
    
    private let forward: () -> Void
    private let backward: () -> Void
    
    init(forward: @escaping () -> Void, backward: @escaping () -> Void) {
        self.forward = forward
        self.backward = backward
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Button {
                self.backward()
            } label: {
                Label("Previous", systemImage: "chevron.left")
            }
            Divider()
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Button {
                self.forward()
            } label: {
                Label("Next", systemImage: "chevron.right")
            }
            
        }
        .labelStyle(.iconOnly)
        .controlSize(.mini)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(white: 0.925))
            )
        
    }
    
    
}
