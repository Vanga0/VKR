//
//  TestView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 16.05.2023.
//

import SwiftUI


struct PodrofileView: View {
    @State private var isEditing = false
    @State private var name = "Vagan"
    @State private var email = "Vagan@mai.com"
    @State private var description = "Я ios разработчик."
    
    var body: some View {
        VStack {
            
            HStack {
                if isEditing {
                    Button(action: {
                        // Save changes to profile
                        self.isEditing.toggle()
                    }) {
                        Text("Сохранить")
                    }
                } else {
                    Button(action: {
                        self.isEditing.toggle()
                    }) {
                        Spacer()
                        Text("Редактировать")
                    }
                }
                
                Spacer()
                
            }
            .navigationBarItems(leading: Button(action: {
                
            }) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
            })
            
        Text("Профиль")
            .font(.title)
        
        
            .padding()
            
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            if isEditing {
                TextField("Name", text: $name)
                    .padding()
                
                TextField("Email", text: $email)
                    .padding()
                
                TextField("Description", text: $description)
                    .padding()
            } else {
                Text(name)
                    .font(.title)
                
                Text(email)
                    .font(.subheadline)
                
                Text(description)
                    .padding()
            }
            
            Spacer()
        }
        // Добавляем кнопку назад в навигационную панель
 
        // Окружение presentationMode
        // для связи с действием навигации назад
        @Environment(\.presentationMode) var presentationMode
    

    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        PodrofileView()
    }
}
