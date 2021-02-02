//
//  Home.swift
//  AnimationTimerApp_16
//
//  Created by emm on 29/01/2021.
//

import SwiftUI
// Sending Notification...
import UserNotifications

struct Home: View {
    
    @StateObject var data = TimerData()
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    // timer buttons...
                    HStack(spacing: 20) {
                        
                        ForEach(1...6, id: \.self) {index in
                            //Each Time Will Be Multiples of 5 ...
                            let time = index * 5
                            
                            Text("\(time)")
                                .font(.system(size: 45, weight: .heavy))
                                .frame(width: 100, height: 100)
                                //changing color for selected ones...
                                .background(data.time == time ? Color("pink") : Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation{
                                        data.time = time
                                        data.selectedTime = time
                                    }
                                }
                        }
                    }
                    .padding()
                })
                // Setting to center...
                .offset(y: 40)
                .opacity(data.buttonAnimation ? 0 : 1)
                
                Spacer()
                
                // start Button...
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.65)){
                        data.buttonAnimation.toggle()
                    }
                    
                    // Delay Animation...
                    // after Button goes Down View is moving up...
                    withAnimation(Animation.easeIn.delay(0.6)) {
                        data.timerViewOffset = 0
                    }
                }, label: {
                    Circle()
                        .fill(Color("pink"))
                        .frame(width: 80, height: 80)
                })
                .padding(.bottom, 35)
                // disabling if not selected...
                .disabled(data.time == 0)
                .opacity(data.time == 0 ? 0.6 : 1)
                
                
                // Moving down Smoothly...
                .offset(y: data.buttonAnimation ? 300 : 0)
            }
            
           Color("pink")
            // Decreasing Height For Each Count...
            .overlay(
                Text("\(data.selectedTime)")
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(.white)
            )

            .frame(height: UIScreen.main.bounds.height - data.timerHeightChange)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea(.all, edges: .all)
            .offset(y: data.timerViewOffset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        
        // Timer Functionality...
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            // Conditions...
            if data.time != 0 && data.selectedTime != 0 && data.buttonAnimation {
                //Counting timer....
                data.selectedTime -= 1
                
                // Updating Height...
                let ProgressHeight = UIScreen.main.bounds.height / CGFloat(data.time)
                
                let diff = data.time - data.selectedTime
                
                withAnimation(.default){
                    data.timerHeightChange = CGFloat(diff) * ProgressHeight
                }
                
                if data.selectedTime == 0{
                    // Resetting...
                    withAnimation(.default){
                        data.time = 0
                        data.selectedTime = 0
                        data.timerHeightChange = 0
                        data.timerViewOffset = UIScreen.main.bounds.height
                        data.buttonAnimation = false
                    }
                }
            }
        })
        .onAppear(perform: {
            // Permissions...
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                
            }
            
            // Setting Delegate For in - App notifications...
            
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
 
