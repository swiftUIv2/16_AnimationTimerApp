//
//  TimerViewModel.swift
//  AnimationTimerApp_16
//
//  Created by emm on 29/01/2021.
//

import SwiftUI
import UserNotifications

// timer model and data ...

class TimerData: NSObject,UNUserNotificationCenterDelegate,ObservableObject {
    
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0
    
    // Animation Properties...
    @Published var buttonAnimation = false
    
    // TimerView Data...
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    @Published var timerHeightChange: CGFloat = 0
    
    // Getting Time When It Leaves The app...
    @Published var leftTime: Date = Date()
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // Telling what to do when received in foreground...
        completionHandler([.banner, .sound])
    }
    
    // onTap...
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // When Tap resetting view...
        print("Notification Tapped")
        completionHandler()
    }
    
    func resetView() {
        withAnimation(.default){
            time = 0
            selectedTime = 0
            timerHeightChange = 0
            timerViewOffset = UIScreen.main.bounds.height
            buttonAnimation = false
        }
    }
}
