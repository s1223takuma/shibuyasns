//
//  timelineView.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/12.
//

import SwiftUI
struct TimelineView: View {
    @StateObject private var viewModel = PostViewModel()
    init(){
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: .alert) { granted, error in
                if granted {
                    print("許可されました！")
                }else{
                    print("拒否されました...")
                }
            }
        }
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.posts) { post in
                        NavigationLink(destination: PostdetailView(post: post)){
                            VStack{
                                PostCardView(post: post)
                                    .padding(.horizontal)
                            }
                        }
                        .listRowSeparatorTint(.black)
                    }
                }
                .padding(.vertical)
                Button(action: {
                    sendNotificationRequest()
                        }, label: {
                            Text("通知を送信")
                        })
            }
            .navigationTitle("タイムライン")
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}

func sendNotificationRequest(){
    // 通知オブジェクト作成
    let content = UNMutableNotificationContent()
    content.title = "通知のタイトルです"
    content.body = "通知の内容です"
    // 通知を発行するトリガー(条件)を設定
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: "通知No.1", content: content, trigger: trigger)
    // 通知を登録
    UNUserNotificationCenter.current().add(request)
}
