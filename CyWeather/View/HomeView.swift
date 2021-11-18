//
//  HomeView.swift
//  CyWeather
//
//  Created by 苏粤翔 on 2021/10/18.
//

import SwiftUI

struct HomeView: View {
    @State var currentTab = "All Photos"
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //导航栏
            
            HStack(spacing: 0){
                TabButton(title: "All Photos", animation: animation, currentTab: $currentTab)
                
                TabButton(title: "Chats", animation: animation, currentTab: $currentTab)
                
                TabButton(title: "Status", animation: animation, currentTab: $currentTab)
            }
            .padding(.top, 20)
            .background(Color("GrassGreen"))

            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    ForEach(1...4, id: \.self){ index in
                        Image("jmuImg\(index)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                            .cornerRadius(8)
                        
                    }
                }
                .padding(15)
            }
        }
        .background(.quaternary)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct TabButton: View{
    var title: String
    var animation: Namespace.ID
    @Binding var currentTab: String
    
    var body: some View{
        Button {
            withAnimation(.spring()){
                currentTab = title
            }
            
        } label: {
            
            VStack{
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                ZStack {
                    
                    if currentTab == title {
                        Capsule()
                            .fill(.white)
                            .shadow(radius: 15)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .frame( height: 3.5)
                    } else {
                        Capsule()
                            .fill(.clear)
                            .frame( height: 3.5)
                    }
                    
                }
                
            }
        }
    }
}
