//
//  ProfileView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                // Avatar
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125,height: 125)
                        .padding()
                    //Info
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name:")
                                .bold()
                            Text("Vasanth Kumar")
                        }
                        .padding()
                        HStack{
                            Text("Email:")
                                .bold()
                            Text("vasanthkumar@gmail.com")
                        }
                        .padding()
                        HStack{
                            Text("Member Since:")
                                .bold()
                            Text("Vasanth Kumar")
                        }
                        .padding()
                        
                    }
                    .padding()
                    //Signout
                    Button("LogOut"){
                        viewModel.logOut()
                    }
                    .tint(Color.red)
                    .padding()
                    Spacer()
                }
                
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
