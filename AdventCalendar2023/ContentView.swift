//
//  ContentView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct ContentView: View {
    
    private enum ViewType: View, Hashable, Identifiable {
        case environment
        var id: String {
            switch self {
                case .environment:
                    return "Sample With Environment"
            }
        }
        var body: some View {
            switch self {
            case .environment:
                return AnyView(EnvironmentContentView())
            }
        }
    }
    
    @State private var presentation: ViewType?
    @State private var items: [ViewType] = [
        .environment
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Button {
                    presentation = item
                } label: {
                    Text("\(item.id)")
                }
            }
        }
        .sheet(item: $presentation) { $0.body }
    }
}

#Preview {
    ContentView()
}
