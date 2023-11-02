//
//  NotificationCenterDetailView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct NotificationCenterDetailView: View {
    
    @State private(set) var item: Todo
    
    var body: some View {
        VStack {
            Text(item.text)
            Button(action: {
                let newTodo = item.copyWith(text: "\(Int.random(in: 1000...10000))")
                item = newTodo
                NotificationCenter.default.post(name: .updateTodo, object: newTodo)
            }) {
                Text("Update")
            }
            .padding()
        }
    }
}

#Preview {
    let todo = Todo(todoId: UUID().uuidString, text: "text")
    return NotificationCenterDetailView(item: todo)
}
