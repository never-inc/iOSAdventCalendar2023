//
//  DetailView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct DetailView: View {
    
    let uuid: String
    
    @EnvironmentObject private var todoController: TodoController
    
    private var item: Todo? {
      todoController.items.first(where: { $0.uuid == uuid })
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
    let todo = Todo(uuid: UUID().uuidString, text: "text")
    let todoController = TodoController()
    todoController.addTodo(todo)
    return DetailView(uuid: todo.uuid)
        .environmentObject(todoController)
}
