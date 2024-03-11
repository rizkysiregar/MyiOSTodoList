//
//  ContentView.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
            TodoListItemsView()
        } else {
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
