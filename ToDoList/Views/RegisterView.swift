//
//  RegisterView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title:"Register", subtitle:"Get Things On", angle: -15.0, background:Color("RegisterHeader"))
            Form{
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(
                    title: "Create Account",
                    background: .green)
                {
                    viewModel.register()
                }
            }
            .offset(y:-50)
         Spacer()
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
