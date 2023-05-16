//
//  TLButton.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct TLButton: View {
    let title :String
    let background:Color
    let action:() -> Void
    var body: some View {
        Button{
            //Attempt to Login
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
            .padding()
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "title",
                 background: Color.gray){
            //Action
        }
    }
}
