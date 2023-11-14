//
//  TheTritonChecklistApp.swift
//  TheTritonChecklist
//
//  Created by andrew austin on 11/14/23.
//

import SwiftUI
import SwiftData

@main
struct TheTritonChecklistApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            WarningView()
                .modelContainer(for: ToDo.self)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Handle the notification when the app is in the foreground.
        // You can customize the presentation options here.
        completionHandler([.banner, .sound])
    }
}
