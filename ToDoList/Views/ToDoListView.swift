//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [TodoListItems]
    init(userId: String) {
        //users/<id>/todos/content
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue:
                ToDoListViewViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                               Text("delete")
                                    
                            }
                            .tint(Color.red)

                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
//                    Action
                    viewModel.showingNewItemsView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented:$viewModel.showingNewItemsView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemsView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "1mtq0Y4HmDPM7Vg7RRIOi1epl6w1")
    }
}
