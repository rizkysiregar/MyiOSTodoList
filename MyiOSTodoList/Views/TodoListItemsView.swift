//
//  TodoListItemsView.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListItemsView: View {
    @StateObject var viewModel: TodoListItemsViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId: String) {
        // users/id/todos/entries
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListItemsViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List Items")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemsView(userId: "kjeKjAlsvGgCr5NQNXf8HUYk9Y82")
    }
}
