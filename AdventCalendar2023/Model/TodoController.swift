//
//  TodoController.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import Foundation

final class TodoController: ObservableObject {
    
    @Published private(set) var items: [Todo]
    
    private let dataSource = DataSource.shared
    
    init() {
        items = dataSource.items.compactMap { Todo.fromDic($0) }
    }
    
    func addTodo(_ todo: Todo) {
        items = [todo] + items
        dataSource.addTodo(todo.toDic())
    }
    
    func fetchTodo(_ todoId: String) -> Todo? {
        if let todo = items.first(where: { $0.todoId == todoId }) {
            return todo
        }
        // もしitemsに存在しなければ、データソースから取得する
        if let dic = dataSource.fetchTodo(todoId), let todo = Todo.fromDic(dic) {
            // TODO: ユースケースよってはitemsにセットする（しないケースもあるけど）
            return todo
        }
        return nil
    }
    
    func updateTodo(_ todo: Todo) {
        items = items.map { $0.todoId == todo.todoId ? todo : $0 }
        dataSource.updateTodo(todo.toDic())
    }
    
    func deleteTodo(_ todoId: String) {
        items = items.filter { $0.todoId != todoId }
        dataSource.deleteTodo(todoId)
    }
}
