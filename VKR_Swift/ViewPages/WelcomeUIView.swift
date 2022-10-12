//
//  WelcomeUIView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 10.10.2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                TitleAndButtonView()
                Image("welcome")
                .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .edgesIgnoringSafeArea(.bottom)
        }
    
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let screen = UIScreen.main.bounds

