//
//  Todo.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/01.
//

import Foundation

struct Todo: Codable, Hashable {
    let todoId: String
    let text: String
    
    // Dic -> Todo
    static func fromDic(_ dic: [String: Any]) -> Todo? {
        let decoder = JSONDecoder()
        if let data = try? JSONSerialization.data(withJSONObject: dic),
           let todo = try? decoder.decode(Todo.self, from: data) {
            return todo
        }
        return nil
    }
    
    // Todo -> Dic
    func toDic() -> [String: Any] {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self), 
            let dic = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            return dic
        }
        return [:]
    }
}

extension Todo {
    static func randomText() -> String {
        "\(Int.random(in: 1000...10000))"
    }
    
    func copyWith(text: String) -> Todo {
        Todo(todoId: todoId, text: text)
    }
}
