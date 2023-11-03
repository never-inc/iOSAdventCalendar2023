//
//  DataSource.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import Foundation

// ローカルDBやAPIの代わりとなるダミーデータ
final class DataSource {
    static let shared = DataSource()
    private(set) var items: [[String: Any]] = (0...19).map { index in ["todoId": UUID().uuidString, "text": "\(index)"] }
    
    func addTodo(_ todo: [String: Any]) {
        items = [todo] + items
    }
    
    func fetchTodo(_ todoId: String) -> [String: Any]? {
        items.first(where: { $0["todoId"] as? String == todoId })
    }
    
    func updateTodo(_ todo: [String: Any]) {
        guard let todoId = todo["todoId"] as? String else {
            return
        }
        items = items.map { $0["todoId"] as? String == todoId ? todo : $0 }
    }
    
    func deleteTodo(_ todoId: String) {
        items = items.filter { $0["todoId"] as? String != todoId }
    }
    
    func clear() {
        items = (0...19).map { index in ["todoId": UUID().uuidString, "text": "\(index)"] }
    }
}
