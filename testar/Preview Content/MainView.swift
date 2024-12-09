//
//  MainView.swift
//  testar
//
//  Created by 関琢磨 on 2024/12/09.
//

import SwiftUI
import RealityKit

struct MainView: View {
    init() {
           let appearance: UITabBarAppearance = UITabBarAppearance()
           appearance.configureWithDefaultBackground()
           UITabBar.appearance().scrollEdgeAppearance = appearance
           UITabBar.appearance().standardAppearance = appearance
       }
    var body: some View {
        TabView{
            ARViewControllerContainer()
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "arkit")
                    Text("AR")//タブバーの①
                }
            TimelineView()
                .tabItem {
                    Image(systemName: "captions.bubble")
                    Text("タイムライン")
                }
            CameracontentView()
                .tabItem{
                    Image(systemName: "camera")
                    Text("カメラ")
                }
            
        }
        .accentColor(.blue)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
