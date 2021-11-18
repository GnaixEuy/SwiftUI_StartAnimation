//
//  ContentView.swift
//  CyWeather
//
//  Created by 苏粤翔 on 2021/10/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen (imageSize: CGSize(width: 128, height: 128)) {
            
            //            主体view
            HomeView()
            
        } titleView: {
            
            Text("GnaixEuy")
                .font(.system(size: 35).bold())
                .foregroundColor(.white)
            
            
        } logoView: {
            Image("chengyilogo")
                .resizable()
                .scaledToFit()//可能出问题
//                .aspectRatio( contentMode: .fit)
        } navButtons: {


            //我的头像框选项
            Button {
                
            } label: {
                Image("chengyilogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
