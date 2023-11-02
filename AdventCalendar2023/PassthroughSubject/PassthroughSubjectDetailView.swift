//
//  PassthroughSubjectDetailView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct PassthroughSubjectDetailView: View {
    
    @State private(set) var item: Todo
    
    var body: some View {
        VStack {
            Text(item.text)
            Button(action: {
                let newTodo = item.copyWith(text: "\(Int.random(in: 1000...10000))")
                item = newTodo
                Observer.shared.todoSubject.send(newTodo)
            }) {
                Text("Update")
            }
            .padding()
        }
    }
}

#Preview {
    let todo = Todo(todoId: UUID().uuidString, text: "text")
    return PassthroughSubjectDetailView(item: todo)
}
