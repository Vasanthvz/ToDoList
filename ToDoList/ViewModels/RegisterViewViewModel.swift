//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import Foundation

class RegisterViewViewModel:ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(name: String = "", email: String = "", password: String = "") {
        self.name = name
        self.email = email
        self.password = password
    }
    func register(){
        guard validate() else{
            return
        }
    }
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,!email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        guard password.count >= 6 else{
            return false
        }
        return true
    }
}
