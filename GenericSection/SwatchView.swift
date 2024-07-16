//
//  SwatchView.swift
//  GenericSection
//
//  Created by Paul Patterson on 10/07/2024.
//

import SwiftUI

struct SwatchView: View {
    
    @State var swatch: Swatch

    var body: some View {
        ZStack {
            swatch.top
                .offset(x: 20, y: 20)
            swatch.middle
            swatch.bottom
                .offset(x: -20, y: -20)
        }
        .padding()
        .clipShape(.rect(cornerRadius: 20))
    }
    
}

#Preview("SwatchView") {
    
    struct Preview: View {
        
        var swatch = Swatch(top: .red, middle: .blue, bottom: .green)
        
        var body: some View {
            SwatchView(swatch: swatch)
                .padding()
        }
        
    }
    
    return Preview()
    
    
}
