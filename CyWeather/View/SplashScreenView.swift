//
//  SplashScreen.swift
//  CyWeather
//
//  Created by 苏粤翔 on 2021/10/15.
//

import SwiftUI

struct SplashScreen<Content: View, Title: View, Logo: View, NavButton: View>: View {
    
    var content: Content
    var titleView: Title
    var logoView: Logo
    var navButton: NavButton
    
    var imageSize: CGSize
    
    //导航栏.....
    
    init(imageSize: CGSize, @ViewBuilder content: @escaping() -> Content,
         @ViewBuilder titleView: @escaping() -> Title,
         @ViewBuilder logoView: @escaping() -> Logo,
         @ViewBuilder navButtons: @escaping () -> NavButton) {
        
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.navButton = navButtons()
        
        self.imageSize = imageSize
    }
    
    //动画状态
    @State var textAnimation: Bool = false
    @State var imageAnimation: Bool = false
    @State var endAnimation: Bool = false
    
    @State var showNavButtons = false
    
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing:0) {
            
            ZStack{
                
                Color("GrassGreen")
                    .background(Color("GrassGreen"))
                    .ignoresSafeArea()
                
                    .overlay(
                        ZStack {
                            titleView
                                .scaleEffect(endAnimation ? 0.75 : 1)
                                .offset(y: textAnimation ? -5 : 110)
                            
                            if !endAnimation {
                                
                                logoView
                                    .matchedGeometryEffect(id: "chengyilogo", in: animation)
                                    .frame(width: imageSize.width, height: imageSize.height)
                                    .offset(y: -5)
                            }
                        }
                    )
                    .overlay(
                        //            向右移动
                        HStack {
                            
                            navButton
                                .opacity(showNavButtons ? 1 : 0)
                            
                            Spacer()
                            
                            if endAnimation {
                                logoView
                                    .matchedGeometryEffect(id: "chengyilogo", in: animation)
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing)
                            }
                        }
                        .padding(.horizontal)
                            .offset(y: -5)
                    )
            }
            //当动画结束时设定大小
            .frame(height: endAnimation ? 60 : nil)
            .zIndex(1)
            
            //头像view
            content
                .frame( height: endAnimation ? nil : 0)
            //图像分层
                .zIndex(0)
            
        }
        .frame( maxHeight: .infinity, alignment: .top)
        .onAppear {
            
            //在一些延迟之后开始动画
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                
                withAnimation(.spring()){
                    textAnimation.toggle()
                }
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                    endAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    withAnimation {
                        showNavButtons.toggle()
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

