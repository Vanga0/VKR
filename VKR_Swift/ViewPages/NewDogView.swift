//
//  NewDogView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 07.04.2023.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var datamanager : DataManager
    @State private var newDog = ""
    
    var body: some View {
        VStack{
        TextField("    Работа", text: $newDog)
                .padding()
//            TextField("Описание", text: $newDog)
//                    .padding()
//            TextField("", text: $newDog)
//                    .padding()
            Button {
                datamanager.addDogs(dogBread: newDog)
            } label: {
                Text("Сохранить")
                
            }
        }
        .padding()
    }
}

struct NewDogView_Previews: PreviewProvider {
    static var previews: some View {
        NewDogView()
    }
}
