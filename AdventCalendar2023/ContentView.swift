//
//  ContentView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct ContentView: View {
    
    private enum Presentation: View, Hashable, Identifiable {
        case environment
        case notificationCenter
        case passthroughSubject
        var id: String {
            switch self {
            case .environment:
                return "Sample With Environment"
            case .notificationCenter:
                return "Sample With NotificationCenter"
            case .passthroughSubject:
                return "Sample With PassthroughSubject"
            }
            
        }
        var body: some View {
            switch self {
            case .environment:
                return AnyView(EnvironmentContentView())
            case .notificationCenter:
                return AnyView(NotificationCenterContentView())
            case .passthroughSubject:
                return AnyView(PassthroughSubjectContentView())
            }
        }
    }
    
    @State private var presentation: Presentation?
    @State private var items: [Presentation] = [
        .environment,
        .notificationCenter,
        .passthroughSubject
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
