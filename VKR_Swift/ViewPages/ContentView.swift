import SwiftUI
import FirebaseCore
import FirebaseAuth


struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ??
    false
    var body: some View {
            
            VStack{
                
                if status{
                    Home()
                }
                else{
                    SingIn()
                }
                
            }.animation(.spring(), value: status) // добавил value: status
                .onAppear {
                    
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                        
                        let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                        self.status = status
                    }
            }
            
        }
    }


    
struct Home : View {
    
    var body : some View{
        
        VStack{
            // обратиться к селект вью и сделать в нём кнопку выхода
            Text("Home")
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
            }) {
                
                Text("Выход")
            }
        }
    }
}


struct SingIn : View {
  //  @State var student = false
  //  @State var company = false
    @State var user = ""
    @State var pass = ""
    @State var messege = ""
    @State var alert = false
    @State var show = false
    var body: some View{
        VStack{
            VStack{
                Text("Вход").fontWeight(.medium).font(.largeTitle).padding([.top,.bottom], 20)
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Имя пользователя").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        HStack{
                            TextField("Введите ваше имя", text: $user)
                            
                            if user != ""{
                                Image("check").foregroundColor(Color.init(.label))
                            }
                        }
                        Divider()
                    }.padding(.bottom,15)
                    VStack(alignment: .leading){
                        Text ("Пароль").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        SecureField("Введите ваш пароль",text: $pass)
                        Divider()
                    }.padding(.bottom,6)
                    Button(action: {
                        singInWithEmail(email: self.user, password: self.pass) { (verified,status) in
                            if !verified{
                                self.messege = status
                                self.alert.toggle()
                            }
                            else{
                                UserDefaults.standard.set(true,forKey: "status")
                                NotificationCenter.default.post( name: NSNotification.Name("statusChange"), object: nil)
                            }
                        }
                    }) {
                        
                        Text("Вход").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        
                    }.background(Color.blue)
                        .clipShape(Capsule())
                        .padding(.top, 55)
                        .padding(.horizontal,30)
                    
                }.padding()
                    .alert(isPresented: $alert) {
                        Alert(title: Text("Ошибка"), message: Text(self.messege), dismissButton: .default(Text("Ok")))
            }
                VStack{
                    Text("(или)").foregroundColor(Color.gray.opacity(0.5)).padding(.top,30)
                    
                    HStack(spacing: 8){
                        Text("Нет акаунта?").foregroundColor(Color.gray.opacity(0.5))
                        
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Text ("Регистрация")
                        }.foregroundColor(.blue)
                        }.padding(.top,25)
                        .padding(.horizontal,30)
                    
                }.sheet(isPresented: $show){
                    SignUp(show: self.show)
                    
                }
                    
            }
        }
    }
}
    
struct SignUp : View {
    @State var student = false
    @State var company = false
    @State var user = ""
    @State var pass = ""
    @State var messege = ""
    @State var alert = false
    @State var show = false
    var body: some View{
        VStack{
            VStack{
                Text("Регистрация").fontWeight(.medium).font(.largeTitle).padding([.top,.bottom], 20)
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Имя пользователя").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        HStack{
                            TextField("Введите ваше имя", text: $user)
                            
                            if user != ""{
                                Image("check").foregroundColor(Color.init(.label))
                            }
                        }
                        Divider()
                    }.padding(.bottom,15)
                    VStack(alignment: .leading){
                        Text ("Пароль").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        SecureField("Введите ваш пароль",text: $pass)
                        Divider()
                    }.padding(.bottom,6)
                    Button(action: {
                        singUpWithEmail(email: self.user, password: self.pass) { (verified,status) in
                            if !verified{
                                self.messege = status
                                self.alert.toggle()
                            }
                            else{
                                UserDefaults.standard.set(true,forKey: "status")
                                NotificationCenter.default.post( name: NSNotification.Name("statusChange"), object: nil)
                            }
                        }
                    }) {
                        
                        Text("Регистрация").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        
                    }.background(Color.blue)
                        .clipShape(Capsule())
                        .padding(.top, 45)
                        .padding(.horizontal,30)
                    
                }.padding()
                    .alert(isPresented: $alert) {
                        Alert(title: Text("Error"), message: Text(self.messege), dismissButton: .default(Text("Ok")))
            }
                VStack{
                    Text("(или)").foregroundColor(Color.gray.opacity(0.5)).padding(.top,30)
                    
                    HStack(spacing: 8){
                        Text(" Уже есть аккаунт?").foregroundColor(Color.gray.opacity(0.5))
                        
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Text ("Вход")
                        }.foregroundColor(.blue)
                        }.padding(.top,25)
                        
                }
            }
        }
    }
}


//MARK


    func singInWithEmail(email: String, password: String, completion: @escaping(Bool,String) -> Void){
        Auth.auth().signIn(withEmail:email, password: password) {(res,err) in
            if err != nil{
                completion(false, (err?.localizedDescription)!)
                return
            }
            completion(true,(res?.user.email)!)
        }
    }
    
func singUpWithEmail(email: String, password: String, completion: @escaping(Bool,String) -> Void){
    Auth.auth().createUser(withEmail:email, password: password) {(res,err) in
        if err != nil{
            completion(false, (err?.localizedDescription)!)
            return
        }
        completion(true,(res?.user.email)!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
