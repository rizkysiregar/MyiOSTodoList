//
//  NewItemViewViewModel.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init () {}
    
    func save() {
        
        guard canSave else {
            return
        }
        
        // get current userId
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createData: Date().timeIntervalSince1970,
            isDone: false)
         
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        // las yt vid 1.55 min
        
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
}
