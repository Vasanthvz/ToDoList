//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import Foundation
import FirebaseFirestore
//View model for list of items view 
class ToDoListViewViewModel:ObservableObject{
    @Published var showingNewItemsView = false
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
