//
//  TodoController.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import Foundation

final class TodoController: ObservableObject {
    
    @Published private(set) var items: [Todo]
    
    private let todoDataSource = TodoDataSource.shared
    
    init() {
        items = todoDataSource.items
    }
    
    func addTodo(_ todo: Todo) {
        items = [todo] + items
        todoDataSource.addTodo(todo)
    }
    
    func fetchTodo(_ todoId: String) -> Todo? {
        if let todo = items.first(where: { $0.todoId == todoId }) {
            return todo
        }
        // もしitemsに存在しなければ、データソースから取得する
        let todo = todoDataSource.fetchTodo(todoId)
        // TODO: ユースケースよってはitemsにもセットする（しないケースもあるけど）
        return todo
    }
    
    func updateTodo(_ todo: Todo) {
        items = items.map { $0.todoId == todo.todoId ? todo : $0 }
        todoDataSource.updateTodo(todo)
    }
    
    func deleteTodo(_ todoId: String) {
        items = items.filter { $0.todoId != todoId }
        todoDataSource.deleteTodo(todoId)
    }
}
