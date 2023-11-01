//
//  Todo.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/01.
//

import Foundation

struct Todo: Hashable {
    let uuid: String
    let text: String
    
    static func create(text: String) -> Todo{
        Todo(uuid: UUID().uuidString, text: text)
    }
}
