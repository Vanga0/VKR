//
//  VKR_SwiftApp.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 09.10.2022.
//

import SwiftUI
import Firebase
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {//NSobj
    
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    // MARK: UISceneSession  Жизненный цикл

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Вызывается при создании нового сеанса сцены.
        // Используйте этот метод, чтобы выбрать конфигурацию для создания новой сцены.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Вызывается, когда пользователь отменяет сеанс сцены.
        // Если какие-либо сеансы были отменены, когда приложение не работало, это будет вызвано вскоре после применения:didFinishLaunchingWithOptions.
        // Используйте этот метод, чтобы высвободить любые ресурсы, относящиеся к отброшенным сценам, поскольку они не вернутся.
    }
    //MARK: Инициализация Firebase
    func applicationDidFinishLaunching(_ application: UIApplication, didfinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    //MARK: Телефонная аутентефикация должна инициализировать Перезапуск уведомлений
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
    
}



@main
struct VKR_SwiftApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
