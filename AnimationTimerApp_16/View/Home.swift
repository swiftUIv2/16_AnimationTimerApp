//
//  Home.swift
//  AnimationTimerApp_16
//
//  Created by emm on 29/01/2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
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
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding()
            })
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
 
