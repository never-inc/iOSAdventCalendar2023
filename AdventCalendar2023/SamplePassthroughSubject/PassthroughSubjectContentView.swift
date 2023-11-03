//
//  PassthroughSubjectContentView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct PassthroughSubjectContentView: View {
    
    @StateObject private var todoController = TodoController()
    
    private var items: [Todo] {
        todoController.items
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink {
                        PassthroughSubjectDetailView(todoId: item.todoId)
                    } label: {
                        Text(item.text)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            // CombineのPassthroughSubject
            .onReceive(Observer.shared.todoSubject) { todo in
                todoController.updateTodo(todo)
            }
            .navigationTitle("Sample With PassthroughSubject")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            todoController.addTodo(Todo(todoId: UUID().uuidString, text: "new"))
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                todoController.deleteTodo(items[index].todoId)
            }
        }
    }
}

#Preview {
    PassthroughSubjectContentView()
}
