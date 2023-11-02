//
//  Todo.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/01.
//

import Foundation

struct Todo: Hashable {
    let todoId: String
    let text: String
    
    func copyWith(text: String) -> Todo {
        Todo(todoId: todoId, text: text)
    }
}
