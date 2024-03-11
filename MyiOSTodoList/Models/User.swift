//
//  User.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
