//
//  TodoListItem.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createData: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
