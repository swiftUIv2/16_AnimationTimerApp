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
}
