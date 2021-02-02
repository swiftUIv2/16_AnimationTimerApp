//
//  AnimationTimerApp_16App.swift
//  AnimationTimerApp_16
//
//  Created by emm on 29/01/2021.
//

import SwiftUI

@main
struct AnimationTimerApp_16App: App {
    @StateObject var data = TimerData()
    
    // Using Scene Phase for scene Data...
    @Environment(\.scenePhase) var scene
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
//        .onChange(of: scene){ (newScene) in
//            if newScene == .background {
//
//                print("app running bg")
//                // Storing Time
//                data.leftTime = Date()
//            }
            
//            if newScene == .active && data.time != 0 {
//                // when it enter again checking the difference...
//                let diff = Date().timeIntervalSince(data.leftTime)
//
//                print(Int(diff))
//                let currentTime = data.selectedTime - Int(diff)
//                if currentTime >= 0 {
//                    withAnimation(.default){
//                        data.selectedTime = currentTime
//                    }
//                }
//                else {
//                    // resetting view...
//                    data.resetView()
//                }
//            }
//        }
    }
}
