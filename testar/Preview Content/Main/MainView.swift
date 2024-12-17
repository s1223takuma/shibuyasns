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
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: .alert) { granted, error in
            if granted {
                print("許可されました！")
            }else{
                print("拒否されました...")
            }
        }
    sendNotificationRequest()
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
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("プロフィール")
                }
        }
        .accentColor(.blue)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

func sendNotificationRequest() {
    // 通知許可の確認
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            let content = UNMutableNotificationContent()
            content.title = "アプリが開かれました"
            content.body = "お題はこちらです"
            content.sound = .default
            
            let request = UNNotificationRequest(
                identifier: "通知No.1",
                content: content,
                trigger: nil
            )
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("通知送信エラー: \(error)")
                }
            }
        }
    }
}
