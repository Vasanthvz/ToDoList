//
//  ContentView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            TabView{
                ToDoListView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            
        }else{
            LoginView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
