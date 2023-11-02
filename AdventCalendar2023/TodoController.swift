//
//  TodoController.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import Foundation

final class TodoController: ObservableObject {
    
    @Published private(set) var items: [Todo]
    
    init() {
        self.items = (0...19).map { index in Todo(todoId: UUID().uuidString, text: "\(index)") }
    }
    
    func addTodo(_ todo: Todo) {
        items = [todo] + items
    }
    
    func updateTodo(_ todo: Todo) {
        items = items.map { $0.todoId == todo.todoId ? todo : $0 }
    }
    
    func deleteTodo(_ todo: Todo) {
        items = items.filter { $0.todoId != todo.todoId }
    }
}
