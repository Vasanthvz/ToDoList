//
//  HeaderView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color .pink)
                .rotationEffect(Angle(degrees: 15))
             
            
            VStack{
                Text("TO DO List")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50))
                Text("Get Things On")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                
            }.padding(.top,30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 300)
        .offset(y:-100)
       
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
