//
//  DetailView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct DetailView: View {
    
    let todoId: String
    
    @EnvironmentObject private var todoController: TodoController
    
    private var item: Todo? {
      todoController.items.first(where: { $0.todoId == todoId })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(item?.text ?? "")
                Button(action: {
                    guard let item = self.item else {
                        return
                    }
                    let newTodo = item.copyWith(text: "\(Int.random(in: 1...100))")
                    todoController.updateTodo(newTodo)
                }) {
                    Text("Update Button")
                }
                .padding()
            }
        }
    }    
}

#Preview {
    let todo = Todo(todoId: UUID().uuidString, text: "text")
    let todoController = TodoController()
    todoController.addTodo(todo)
    return DetailView(todoId: todo.todoId)
        .environmentObject(todoController)
}
