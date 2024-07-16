//
//  CoverFlowSection.swift
//  CoverFlowScrollView
//
//  Created by Paul Patterson on 10/07/2024.
//

import SwiftUI


struct CoverFlowSection<Model: Identifiable, ModelView: View>: View {
    
    var title: String
    @Binding var model: [Model]
    @State var selection: Model.ID?
    private(set) var displayScrollButtons: Bool = true
    @ViewBuilder var modelView: (Model) -> ModelView
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title2.bold())
                if displayScrollButtons {
                    Spacer()
                    ForwardBackwardView(forward: selectNext, backward: selectPrevious)
                }
            }
            .padding(.horizontal, 20)
            
            CoverFlowScrollView(model: $model, selection: $selection, modelViewBuilder: modelView)
        }
    }
    
    func selectNext() {
        let maxIndex = model.count - 1
        if let index = model.firstIndex(where: { $0.id == selection }), index < maxIndex {
            withAnimation {
                selection = model[index + 1].id
            }
        }
    }
    
    func selectPrevious() {
        if let index = model.firstIndex(where: { $0.id == selection}), index != .zero {
            withAnimation {
                selection = model[index - 1].id
            }
        }
    }
}




#Preview("Previous/Next") {
    
    ForwardBackwardView {
        print("forward")
    } backward: {
        print("backward")
    }

    
}


#Preview {
    
    struct Preview: View {
        
        @State var model = [1,2,3]
        
        var body: some View {
            CoverFlowSection(title: "Recents", model: $model, selection: model[0].id) { int in
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
