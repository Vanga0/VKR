//
//  DataManager.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 01.04.2023.
//

import SwiftUI
import Firebase
//добавление инфы в бд к пользователю
class DataManager: ObservableObject{
    @Published var dogs : [Work] = []
    init(){
        fetchDogs()
    }
    func fetchDogs(){
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot{
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let breed = data["breed"] as? String ?? ""
                    
                    let dog = Work(id: id, breed: breed )
                    self.dogs.append(dog)
                }
            }
        }
    }
    let randomId = arc4random_uniform(1000) // генерация случайного числа от 0 до 999
    func addDogs(dogBread: String){
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogBread)
        ref.setData(["breed" : dogBread, "id": randomId]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
}

