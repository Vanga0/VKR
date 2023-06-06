//
//  HomePage.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 09.10.2022.
//

import SwiftUI

struct HomePage:View {
    var body: some View{
        VStack {
            VStack  {
                Text("Я Студент").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                
            }.background(Color.blue)
                .clipShape(Capsule())
                .padding(.top,5)
                .padding(.horizontal,30)
            
            VStack{
                Text("Я Работодатель").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                
            }.background(Color.blue)
                .clipShape(Capsule())
                .padding(.top,5)
            .padding(.horizontal,30)
            
        
            }
        }
    }



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

let screen = UIScreen.main.bounds
