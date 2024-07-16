//
//  ContentView.swift
//  GenericSection
//
//  Created by Paul Patterson on 10/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var words: [Word] = [
        Word("turbid", definition: "(of a liquid) cloudy, opaque, or thick with suspended matter."),
        Word("turgid", definition: "(of language, writing, etc.) boring, complicated, and difficult to understand"),
        Word("torpor", definition: "the state of not being active and having no energy or enthusiasm")]
    

    @State var symbolNames: [SFSymbol] = ["heart.fill", "snowflake", "paperplane"]
    
    @State var swatchs: [Swatch] = [
        Swatch(top: .brown, middle: .cyan, bottom: .red),
        Swatch(top: .green, middle: .gray, bottom: .orange),
        Swatch(top: .purple, middle: .teal, bottom: .indigo)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 40) {
                    CoverFlowSection(title: "Words", model: $words, selection: words[0].id) { word in
                        WordView(word: word)
                    }
                    CoverFlowSection(title: "Swatches", model: $swatchs, selection: swatchs[0].id, displayScrollButtons: false) { swatch in
                        SwatchView(swatch: swatch)
                    }
                    CoverFlowSection(title: "SF Symbols", model: $symbolNames, selection: symbolNames[0].id) { symbolName in
                        Image(systemName: symbolName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .foregroundStyle(.orange)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .background(.black)
                    }
                }

                
            }
        }
        
    }
}



#Preview("Main") {
    ContentView()
}
