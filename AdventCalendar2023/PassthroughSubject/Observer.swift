//
//  Observer.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import Combine

final class Observer {
    internal static let shared = Observer()
    let todoSubject = PassthroughSubject<Todo, Never>()
}
