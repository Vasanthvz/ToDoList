//
//  NewItemsViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewViewModel:ObservableObject{
    @Published var title = ""
    @Published var showAlert = false
    @Published var dueDate = Date()
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        // Get current User id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create Model
        let newId = UUID().uuidString
        let newItem = TodoListItems(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
    
        //Save to database
        let db = Firestore.firestore()
        db.collection("user")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave:Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
