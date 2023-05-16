//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//
import FirebaseAuth
import Foundation
class MainViewViewModel:ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init() {
        self.currentUserId = currentUserId
        self.handler = Auth.auth().addIDTokenDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}

