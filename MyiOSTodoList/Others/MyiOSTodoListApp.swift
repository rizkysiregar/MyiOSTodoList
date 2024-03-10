//
//  MyiOSTodoListApp.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import FirebaseCore
import SwiftUI

@main
struct MyiOSTodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
        
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
