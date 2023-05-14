//
//  LoginView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
//            Header
            HeaderView()
//            Login Form
            Form{
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top,10)
                SecureField("Password", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                Button{
                    //Attempt to Login
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.gray)
                        Text("Log In")
                            .bold()
                            .foregroundColor(Color.white)
                    }.padding()
                }
            }
            
//            Create Account
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
