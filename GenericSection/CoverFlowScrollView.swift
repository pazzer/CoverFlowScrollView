//
//  CoverFlowView.swift
//  GenericSection
//
//  Created by Paul Patterson on 10/07/2024.
//

import SwiftUI

struct CoverFlowScrollView<Model: Identifiable, ModelView: View>: View {
    
    
    @Binding var model: [Model]
    
    @ViewBuilder var modelViewBuilder: (Model) -> ModelView
    
    init(model: Binding<[Model]>, @ViewBuilder modelViewBuilder: @escaping (Model) -> ModelView) {
        self._model = model
        self.modelViewBuilder = modelViewBuilder
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(model, id: \.id) { item in
                    modelViewBuilder(item)
                        .containerRelativeFrame(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, count: 1, spacing: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(
                                    x: phase.isIdentity ? 1.0 : 0.80,
                                    y: phase.isIdentity ? 1.0 : 0.80)
                        }
                }
            }
            .scrollTargetLayout()
            
        }
        .contentMargins(.horizontal, 20)
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.never)
        .aspectRatio(16.0/9, contentMode: .fit)
    }
}




#Preview("Words") {
    
    struct Preview: View {
        
        @State var words: [Word] = [
            Word("turbid", definition: "(of a liquid) cloudy, opaque, or thick with suspended matter."),
            Word("turgid", definition: "(of language, writing, etc.) boring, complicated, and difficult to understand"),
            Word("torpor", definition: "the state of not being active and having no energy or enthusiasm")]


        
        var body: some View {
            CoverFlowScrollView(model: $words) { word in
                WordView(word: word)
            }
        }
        
    }
    
    return Preview()
}


#Preview("Numbers") {
    
    struct Preview: View {
        
        @State var model = [1,2,3]
        
        var body: some View {
            CoverFlowScrollView(model: $model) { int in
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
