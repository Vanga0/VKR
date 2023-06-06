//
//  ListView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 07.04.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopUp = false
    
    var body: some View {
        NavigationView{
            List(dataManager.dogs, id: \.id) { dog in
                //Text(dog.breed)
                Text("Vagan Albertyan -  Engeneer")
            }
            .navigationTitle("Создание вакансии")
            .navigationBarItems(trailing: Button( action: {
                showPopUp.toggle()
            }) {
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Image(systemName: "plus")

                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 55, height: 55)
                            .background(Color.blue)
                            .clipShape(Circle())

                    }
                }
                .padding(.bottom, 10) // отступ снизу
                .padding(.trailing, 20) // отступ слева
            })
                .frame(maxWidth: .infinity, alignment: .bottomLeading) // выравнивание по левому нижнему углу


            .sheet(isPresented: $showPopUp){
                NewDogView()
            }
        }
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
