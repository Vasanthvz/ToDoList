//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
//View model for single to do list item 
class ToDoListItemViewViewModel:ObservableObject{
    init(){
        
    }
    func toggleIsDone(item: TodoListItems){
        var itemcopy = item
        itemcopy.setDone( !item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemcopy.id)
            .setData(itemcopy.asDictionary())
    }
}
