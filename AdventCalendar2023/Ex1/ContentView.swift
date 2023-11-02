//
//  ContentView.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/01.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @StateObject private var todoController = TodoController()
    
    private var items: [Todo] {
        todoController.items
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink {
                        DetailView(uuid: item.uuid)
                            .environmentObject(todoController)
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
            todoController.addTodo(Todo(uuid: UUID().uuidString, text: "new"))
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
    ContentView()
}
