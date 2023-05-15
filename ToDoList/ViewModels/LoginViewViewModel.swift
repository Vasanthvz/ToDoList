//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import Foundation

class LoginViewViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    func validate(){
        
    }
}
