//
//  CoverFlowSection.swift
//  GenericSection
//
//  Created by Paul Patterson on 10/07/2024.
//

import SwiftUI

struct CoverFlowSection<Model: Identifiable, ModelView: View>: View {
    
    var title: String
    
    @Binding var model: [Model]
    @ViewBuilder var modelView: (Model) -> ModelView
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2.bold())
                .padding(.horizontal, 20)
            CoverFlowScrollView(model: $model, modelViewBuilder: modelView)
        }
    }
}

extension Int: Identifiable {
    
    public var id: Int {
        self
    }
}

#Preview {
    
    struct Preview: View {
        
        @State var model = [1,2,3]
        
        var body: some View {
            CoverFlowSection(title: "Recents", model: $model) { int in
                Text("\(int)")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.orange)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.black)
            }
        }
        
    }
    
    return Preview()
}
