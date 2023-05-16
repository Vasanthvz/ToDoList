//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import FirebaseAuth //Firebase backend
import Foundation

class LoginViewViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    func login(){
        guard validate() else{
            return
        }
    }
//    Validating the email is correct or not
    func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all field."
            return false
            
        }
        guard email.contains("@") && email.contains(".com")else{
            
            errorMessage = "Enter a valid email."
            return false
            
        }
        return true
    }
}
