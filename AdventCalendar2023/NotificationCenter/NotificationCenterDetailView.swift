//
//  NotificationCenterDetailView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct NotificationCenterDetailView: View {
    
    let todoId: String
    @State private(set) var item: Todo?
    private let todoDataSource = TodoDataSource.shared
    
    var body: some View {
        VStack {
            Text(item?.text ?? "")
            Button(action: {
                guard let item = self.item else {
                    return
                }
                let newTodo = item.copyWith(text: Todo.randomText())
                self.item = newTodo
                todoDataSource.updateTodo(newTodo)
                NotificationCenter.default.post(name: .updateTodo, object: newTodo)
            }) {
                Text("Update")
            }
            .padding()
        }
        .onAppear {
            // データソースから取得
            item = todoDataSource.fetchTodo(todoId)
        }
    }
}

#Preview {
    let todo = Todo(todoId: UUID().uuidString, text: "text")
    return NotificationCenterDetailView(todoId: todo.todoId)
}
