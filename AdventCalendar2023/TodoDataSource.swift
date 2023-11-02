//
//  DataSource.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import Foundation

// ダミーデータ: 実際はローカルDBやAPIになる
final class TodoDataSource {
    static var shared = TodoDataSource()
    private(set) var items = (0...19).map { index in Todo(todoId: UUID().uuidString, text: "\(index)") }
    
    func addTodo(_ todo: Todo) {
        items = [todo] + items
    }
    
    func fetchTodo(_ todoId: String) -> Todo? {
        items.first(where: { $0.todoId == todoId })
    }
    
    func updateTodo(_ todo: Todo) {
        items = items.map { $0.todoId == todo.todoId ? todo : $0 }
    }
    
    func deleteTodo(_ todoId: String) {
        items = items.filter { $0.todoId != todoId }
    }
    
    func clear() {
        items = (0...19).map { index in Todo(todoId: UUID().uuidString, text: "\(index)") }
    }
}
