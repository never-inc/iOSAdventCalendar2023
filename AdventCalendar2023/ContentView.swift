//
//  ContentView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/01.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @StateObject private var todoListController = TodoListController()
    
    private var items: [Todo] {
        todoListController.items
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink {
                        NavigationView {
                            Text(item.text)
                        }
                        .navigationTitle(item.uuid)
                    } label: {
                        Text(item.text)
                    }
                }
                .onDelete(perform: deleteItems)
            }
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
            todoListController.addTodo(Todo.create(text: "new"))
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                todoListController.deleteTodo(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
}
