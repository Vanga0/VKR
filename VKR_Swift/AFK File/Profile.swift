//
//  PersonalArea.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 14.10.2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import CoreMedia

//1. Создать лист вью с выводом сюда же то что буду добавлять через плюс, к плюсу прикрутить возможность добавлять 3 типа данных через базу данных

struct ProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            List {
                Text("")
                Text("")
                Text("")
                Text("")
                Text("")
                Text("")
                
            }
            HStack {
                

                Spacer()
                NavigationLink(destination: JobRequestView()){ // navilink куда переходит кнопка
                    Button(action: {
                        // действие, выполняемое при нажатии на кнопку
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .frame(width: 55, height: 55)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(.trailing, 40)
                .padding(.bottom, 10)
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
