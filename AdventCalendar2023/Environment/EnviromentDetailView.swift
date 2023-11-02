//
//  EnvironmentDetailView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct EnvironmentDetailView: View {
    
    let todoId: String
    @State private(set) var item: Todo?
    @EnvironmentObject private var todoController: TodoController
    
    var body: some View {
        VStack {
            Text(item?.text ?? "")
            Button(action: {
                guard let item = self.item else {
                    return
                }
                let newTodo = item.copyWith(text: Todo.randomText())
                self.item = newTodo
                todoController.updateTodo(newTodo)
            }) {
                Text("Update")
            }
            .padding()
        }
        .onAppear {
            item = todoController.fetchTodo(todoId)
        }
    }
}

#Preview {
    let todo = Todo(todoId: UUID().uuidString, text: "text")
    let todoController = TodoController()
    todoController.addTodo(todo)
    return EnvironmentDetailView(todoId: todo.todoId)
        .environmentObject(todoController)
}
