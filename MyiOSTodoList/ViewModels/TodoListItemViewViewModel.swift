//
//  TodoListItemViewViewModel.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class TodoListItemViewViewModel: ObservableObject {
    
    init () {}
    
    func tonggleIsDone(item: TodoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        print("uid not null: " + uid)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
