//
//  JobRequestView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 04.01.2023.
//
//Этот код создает представление JobRequestView для формы отправки заявки на работу. В этом представлении есть два текстовых поля для ввода названия вакансии и описания, а также кнопка для отправки заявки.

//Когда пользователь нажимает кнопку "Сохранить", вызывается функция save, которая сохраняет данные о заявке в базу данных Firebase Realtime Database. Данные сохраняются в виде дочернего узла с идентификатором текущего пользователя (user!.uid).

//В случае возникновения ошибки при сохранении данных в базу данных, в переменную error записывается сообщение об ошибке, которое отображается на экране.
//
import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct JobRequestView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var error: String = ""
    @State private var isLoading: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Название вакансии", text: $title)
                .padding()
            TextField("Описание", text: $description)
                .padding()
            if (error != "") {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding()
            }
            Button(action: save) {
                Text("Сохранить")
            }
            .padding()
            .disabled(isLoading)
        }
    }
    
    func save() {
        self.isLoading = true
        let user = Auth.auth().currentUser
        let ref = Database.database().reference().child("jobs").child(user!.uid)
        let values = ["title": self.title, "description": self.description]
        ref.updateChildValues(values) { (error, ref) in
            self.isLoading = false
            if error != nil {
                self.error = error!.localizedDescription
            } else {
                self.title = ""
                self.description = ""
                self.error = ""
            }
        }
    }
}

struct JobRequestView_Previews: PreviewProvider {
    static var previews: some View {
        JobRequestView()
    }
}
