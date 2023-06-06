//
//  PhoneLoginViewModel.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 08.04.2023.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseAuth
//логин/пароль через мобилку

class LoginViewModel: ObservableObject {
    //MARK: View properties
    @Published var mobileNo :String = ""
    @Published var otpCode: String = ""
    
    @Published var CLIENT_CODE: String = ""
    @Published var showOTPField: Bool = false
    
    //MARK: Error Properties
    @Published var showError: Bool = false
    @Published var errorMessage:String = ""
    
    //MARK: Firebase API's
    func getOTPCode(){
        UIApplication.shared.closeKeyboard()
        Task{
            do{
                //MARK: выключаем когда тестим на настоящем телефоне
                Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                
                let code = try await PhoneAuthProvider.provider().verifyPhoneNumber("+ \(mobileNo)", uiDelegate: nil)
                await MainActor.run(body:{
                    CLIENT_CODE = code
                    //MARK: Включается когда отп филд работает
                    withAnimation(.easeInOut){
                        showOTPField = true
                    }
                })
            }catch{
                await handleError(error: error)
            }
        }
    }
    
    func verifyOTPCode(){
        UIApplication.shared.closeKeyboard()
        Task{
            do{
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: CLIENT_CODE, verificationCode: otpCode)
                try await Auth.auth().signIn(with: credential)
                print("выполнено")
            }catch{
                await handleError(error: error)
            }
        }
    }

    //MARK: Handling Error
    func handleError(error:Error)async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
}

extension UIApplication{
    func closeKeyboard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
