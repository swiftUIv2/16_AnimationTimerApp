//
//  Home.swift
//  AnimationTimerApp_16
//
//  Created by emm on 29/01/2021.
//

import SwiftUI

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
                
                Spacer()
                
                // start Button...
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.65)){
                        data.buttonAnimation.toggle()
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
            .ignoresSafeArea(.all, edges: .all)
            .overlay(
                Text("\(data.selectedTime)")
                    .font(.system(size: 55, weight: .heavy))
                    .foregroundColor(.white)
            )
            .offset(y: data.timerViewOffset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
 
