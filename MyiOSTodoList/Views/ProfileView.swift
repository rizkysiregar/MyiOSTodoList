//
//  ProfileView.swift
//  MyiOSTodoList
//
//  Created by Rizky Siregar on 10/03/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profileView(user: user)
                } else {
                    Text("Loading data ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profileView(user: User) -> some View {
        Image(systemName:"person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            
            HStack {
                Text("Member Since: ")
                Text(
                    "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))"
                )
            }
        }
        .padding()
        
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
