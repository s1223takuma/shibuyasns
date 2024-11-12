//
//  ContentView.swift
//  testar
//
//  Created by 関琢磨 on 2024/10/17.
//

import SwiftUI
import RealityKit

struct ContentView: View {
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
                    Image(systemName: "doc.text")
                    Text("AR")//タブバーの①
                }
            TimelineView()
                .tabItem {
                    Image(systemName: "key")
                    Text("パスワード")
                }
            
        }
        .accentColor(.blue)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
