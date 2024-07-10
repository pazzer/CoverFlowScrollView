//
//  WordView.swift
//  GenericSection
//
//  Created by Paul Patterson on 10/07/2024.
//

import SwiftUI

struct WordView: View {
    
    var word: Word
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(word.word.lowercased())
                .font(.title2)
            Divider()
            VStack {
                Text(word.definition)
                    .font(.caption)
            }
            .padding(.top, 8)
            Spacer()
            
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(WordBackground())
        .padding(6)
        
    }
}


struct WordBackground: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.cream)
            .shadow(radius: 4)
            
    }
}

#Preview {
    
    
    struct Preview: View {
        
        @State var word: Word
        
        var body: some View {
            WordView(word: word)
                .padding()
                .aspectRatio(16.9/9, contentMode: .fit)
        }
        
    }
    
    return Preview(word: 
        Word("Turbid",
        definition: "(of a liquid) cloudy, opaque, or thick with suspended matter."))
        
}
