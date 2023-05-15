//
//  RegisterView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            HeaderView(title:"Register", subtitle:"Get Things On", angle: -15.0, background:Color.orange)
            Form{
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(
                    title: "Create Account",
                    background: .green)
                {
                    //Attempt Registration
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
