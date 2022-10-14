//
//  SelectView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 10.10.2022.
//


// Создаю отдельно макеты, в вью который возвращаю обращаюсь к этим вью чтоб их выводить

import SwiftUI

struct HomeView: View {
    
    let Name = "Vagan" // имя пользователя получить с личного кабинета
    @State var selectedCategory: Category = categories[0] // сюда передавать поле типа работ данных зарегестрированных работодателей
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                AppBarView()
                Text("Hi \(Name)")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(0.42))
                    .padding(.horizontal)
                    .padding(.top)
                Text("Горячие вакансии ждут вас")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                JobCardView()
                
                CategoryListView(selectedCategory: self.$selectedCategory)
                
                ForEach(jobs, id: \.id) { job in
                    JobSmallCardView(job: job)
                    

                }
                LogOut()
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(uiImage: #imageLiteral(resourceName: "Profile")) // знак профиля слева
            }.buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(uiImage: #imageLiteral(resourceName: "Menu")) // знак меню справа
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct JobCardView: View {
    var body: some View {
        ZStack (alignment: .bottom) {
            (Color.blue)
                .aspectRatio(4, contentMode: .fit)
                .cornerRadius(25)
            HStack (alignment: .bottom){
                VStack (alignment: .leading, spacing: 5) {
                    
                    Text("UI/UX Designer")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Caltech   .  California").foregroundColor(.white)
                }.padding(.bottom, screen.width * 0.055)
                
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "ux"))
                    .resizable()
                    .frame(width: screen.width * 0.3, alignment: .bottom)
                    .aspectRatio(1.2, contentMode: .fill)
            }
            .padding(.horizontal, 25)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct CategoryListView: View { // выбор категорий
    
    @Binding var selectedCategory: Category
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false){
            HStack (){
                ForEach(categories) { category in
                    Text(category.name)
                        .foregroundColor(Color.white)
                        .fontWeight(.medium)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        //.animation(.easeInOut) //  анимация не нужна пока не прикручена кнопка
                        .onTapGesture {
                            self.selectedCategory = category
                    }
                }
            }
            .padding(.all)
        }
    }
}

struct JobSmallCardView: View {
    var job : Job
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(job.title)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 4)
                Text(job.location)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color.blue.opacity(0.54)) //opacity- прозрачность
            }
            Spacer()
            Image(uiImage: job.image)
        }
        .padding(.all)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(25)
        .padding(.horizontal)
      //  .padding(.vertical, 5)
    }
}

// вывести снизу логаут
 struct LogOut: View{
//     @Binding var Contetnview:ContentView
    var body: some View{
        HStack {
            VStack  {
            Spacer()
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)

            }) {
                Text("Выход").foregroundColor(Color.gray.opacity(0.5))
                
                }
            }
        } .padding(.top, 55)
          .padding(.horizontal,189)
    }
}

