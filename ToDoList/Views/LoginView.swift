//
//  LoginView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
    //            Header
                HeaderView(title:"To Do List", subtitle:"Get Things On", angle: 15.0, background:Color.gray)
    //            Login Form
                Form{
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.top,10)
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        
                    TLButton(
                        title: "Login",
                        background: .black)
                    {
                        //Attempt Login
                    }
                    
                }
                .offset(y:-50)
    //            Create Account
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Create an Account", destination:RegisterView())
                }
                .padding(.bottom,80)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
