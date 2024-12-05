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
        sendNotificationRequest()
        }
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    NavigationLink(destination: PostdetailView(post: post)) {
                        VStack{
                            PostCardView(
                                post: post,
                                isLiked: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].islikes,
                                isRetweeted: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].isretweets,
                                retweets: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].retweets,
                                likes: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].likes
                            )
                            Divider()
                            
                        }
                        
                    }
                    .listRowSeparator(.hidden) // セパレータを非表示
                    .listRowInsets(EdgeInsets()) // デフォルトのパディングを削除
                }
            }
            .listStyle(PlainListStyle()) // システムのリストスタイルを無効化
            .background(Color(.systemBackground)) // 背景色をシステムに合わせる
            .navigationBarTitleDisplayMode(.inline) // ナビゲーションバータイトルをインラインに
            .navigationTitle("タイムライン")
            .navigationBarItems(
                leading: Image("myavatar")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            )
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
    content.title = "アプリから離れたのを検知しました"
    content.body = "アプリに戻ってください"
    // 通知を発行するトリガー(条件)を設定
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: "通知No.1", content: content, trigger: trigger)
    // 通知を登録
    UNUserNotificationCenter.current().add(request)
}
