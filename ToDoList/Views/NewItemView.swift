//
//  NewItemView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top,100)
            Form{
                
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.bottom, 10)
                    .padding(.top,15)
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                TLButton(title: "Save",
                         background: .black){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }.padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error") ,
                      message: Text("Please fill in all fields and select due date is today or newer"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
        return true
        }, set: { _ in
        }))
    }
}
