//
//  NotificationCenterContentView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/02.
//

import SwiftUI

struct NotificationCenterContentView: View {
    
    @StateObject private var todoController = TodoController()
    
    private var items: [Todo] {
        todoController.items
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink {
                        NotificationCenterDetailView(item: item)
                    } label: {
                        Text(item.text)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            // NotificationCenter + Combine
            .onReceive(NotificationCenter.default.publisher(for: .updateTodo)) { value in
                guard let todo = value.object as? Todo else {
                    return
                }
                todoController.updateTodo(todo)
            }
            .navigationTitle("Sample With NotificationCenter")
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
        } detail: {
            Text("Select an item")
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
                todoController.deleteTodo(items[index])
            }
        }
    }
}

#Preview {
    NotificationCenterContentView()
}