//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//
import FirebaseAuth
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
//        Back-ends
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result ,error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(i: userId)
        }
    }
    private func insertUserRecord(i:String){
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,!email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Fill all the Field"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Enter a valid email"
            return false
        }
        guard password.count >= 6 else{
            errorMessage = "enter password more than 6 characters"
            return false
        }
        return true
    }
}
