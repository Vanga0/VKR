//
//  PhoneAuthView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 08.04.2023.
//

import SwiftUI
import FirebaseAuth
import Firebase
//
struct PhoneAuthView: View {
//    @StateObject var loginModel: LoginViewModel = .init()
//    var body: some View {
//        ScrollView(.vertical,showsIndicators: false){
//            VStack(alignment: .leading, spacing: 15){
//              //  Image(systemName: "triangle")
//                //    .font(.system(size: 38))
////.foregroundColor(.indigo)
//
//                (Text("Привет, воин ")
//                    .foregroundColor(.black) +
//                Text("\nВойди чтоб продолжить")
//                .foregroundColor(.gray))
//                .font(.title)
//                .fontWeight(.semibold)
//                .lineSpacing(10)
//                .padding(.top,20)
//                .padding(.trailing,15)
//
//                CustomTextField(hint: "+79999999999", text: $loginModel.mobileNo)
//                    .disabled(loginModel.showOTPField)
//                    .opacity(loginModel.showOTPField ? 0.4 : 1)
//                    .overlay(alignment: .trailing, content: {
//                        Button("Change"){
//                            withAnimation(.easeInOut){
//                                loginModel.showOTPField = false
//                                loginModel.otpCode = ""
//                                loginModel.CLIENT_CODE = ""
//                            }
//                        }
//                        .font(.caption)
//                        .foregroundColor(.indigo)
//                        .opacity(loginModel.showOTPField ? 1 : 0)
//                        .padding(.trailing,15)
//                    })
//                CustomTextField(hint: "otp Code", text: $loginModel.otpCode)
//                    .disabled(!loginModel.showOTPField)
//                    .opacity(!loginModel.showOTPField ? 0.4 : 1)
//                    .padding(.top,20)
//
//                Button (action: loginModel.showOTPField ? loginModel.verifyOTPCode: loginModel.getOTPCode) {
//                    HStack(spacing: 15){
//                        Text(loginModel.showOTPField ? "Verify Code" : "Введите код")
//                            .fontWeight(.semibold)
//                            .contentTransition(.identity)
//                        //кнопка
//                        Image(systemName: "line.diagonal.arrow")
//                            .font(.title3)
//                            .rotationEffect(.init(degrees: 45))
//                    }.foregroundColor(.black)
//                        .padding(.horizontal,25)
//                        .padding(.vertical)
//                        .background{
//                            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                .fill(.black.opacity(0.05))
//                        }
//
//                }
//            }
//            .padding(.leading,60)
//            .padding(.vertical,15)
//        }
//        .alert(loginModel.errorMessage, isPresented: $loginModel.showError){
//
//        }
//    }
//}
//
//
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
       
        VStack{
            
            if status{
                
                Home()
            }
            else{
                
                NavigationView{
                    
                     FirstPage()
                }
            }
            
        }.onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
               let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                   
                self.status = status
            }
        }
       
    }
}

struct FirstPage : View {
    
    @State var ccode = ""
    @State var no = ""
    @State var show = false
    @State var msg = ""
    @State var alert = false
    @State var ID = ""
    
    var body : some View{
        
        VStack(spacing: 20){
            
            Image("pic")
            
            Text("Вход").font(.largeTitle).fontWeight(.heavy)
            
            Text("Введите номер телефона чтоб войти")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 12)
            
            HStack{
                
                TextField("+7", text: $ccode)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
                    .padding()
                    .background(Color("Color"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                   
                
                TextField("Номер", text: $no)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color("Color"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            } .padding(.top, 15)

            NavigationLink(destination: ScndPage(show: $show, ID: $ID), isActive: $show) {
                
                
                Button(action: {
                    
                    PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.ccode+self.no, uiDelegate: nil) { (ID, err) in
                        
                        if err != nil{
                            
                            self.msg = (err?.localizedDescription)!
                            self.alert.toggle()
                            return
                        }
                        
                        self.ID = ID!
                        self.show.toggle()
                    }
                    
                    
                }) {
                    
                    Text("Подтвердить").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                    
                }.foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }

            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }.padding()
        .alert(isPresented: $alert) {
                
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}

struct ScndPage : View {
    
    @State var code = ""
    @Binding var show : Bool
    @Binding var ID : String
    @State var msg = ""
    @State var alert = false
    
    var body : some View{
        
        ZStack(alignment: .topLeading) {
            
            GeometryReader{_ in
                
                VStack(spacing: 20){
                    
                    //Image("pic")
                    
                    Text("Verification Code").font(.largeTitle).fontWeight(.heavy)
                    
                    Text("Please Enter The Verification Code")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 12)

                    TextField("Code", text: self.$code)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color("Color"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top, 15)

                    
                    Button(action: {
                        
                       let credential =  PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                        
                        Auth.auth().signIn(with: credential) { (res, err) in
                            
                            if err != nil{
                                
                                self.msg = (err?.localizedDescription)!
                                self.alert.toggle()
                                return
                            }
                            
                            UserDefaults.standard.set(true, forKey: "status")
                            
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                        
                    }) {
                        
                        Text("Verify").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                        
                    }.foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                }
                
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image(systemName: "chevron.left").font(.title)
                
            }.foregroundColor(.orange)
            
        }
        .padding()
        .alert(isPresented: $alert) {
                
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}

struct PhoneAuthView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            PhoneAuthView()
        }
    }
}
