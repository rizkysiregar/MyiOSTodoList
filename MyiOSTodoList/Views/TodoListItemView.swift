//
//  TodoListItemView.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import SwiftUI

struct TodoListItemView: View {
    
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: TodoListItem
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text(
                    "\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))"
                )
                .font(.footnote)
                .foregroundColor(Color.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.tonggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle" )
            }
        }
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: .init(
            id: "123",
            title: "Get Some Milk",
            dueDate: Date().timeIntervalSince1970,
            createData: Date().timeIntervalSince1970,
            isDone: true
        ))
    }
}
