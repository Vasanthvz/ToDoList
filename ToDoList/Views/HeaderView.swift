//
//  HeaderView.swift
//  ToDoList
//
//  Created by Vasanth Kumar V on 14/05/23.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subtitle : String
    let angle : Double
    let background : Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
             
            
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50))
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                
            }.padding(.top,30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 350)
        .offset(y:-150)
       
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title:"To Do List", subtitle:"Get Things On", angle: 15.0, background: Color("Pink") )
    }
}
