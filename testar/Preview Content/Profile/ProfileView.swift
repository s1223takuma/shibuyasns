//
//  ProfileView.swift
//  testar
//
//  Created by 関琢磨 on 2024/12/10.
//

import SwiftUI

struct ProfileView: View {
    // プロフィールデータのモデル
    struct ProfileData {
        let username: String
        let fullName: String
        let bio: String
        let postCount: Int
        let followerCount: Int
        let followingCount: Int
        let profileImageName: String
    }
    
    // サンプルデータ
    let profile = ProfileData(
        username: "@swiftuser",
        fullName: "田中 太郎",
        bio: "エアプボンドルドファンクラブ会長",
        postCount: 256,
        followerCount: 1200,
        followingCount: 450,
        profileImageName: "myavatar"
    )
    
    var body: some View {
        NavigationView{
            VStack(spacing: 10) {
                VStack {
                    Image(profile.profileImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.blue, lineWidth: 3)
                        )
                    
                    Text(profile.fullName)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(profile.username)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // バイオグラフィーセクション
                Text(profile.bio)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                // フォロー統計セクション
                HStack(spacing: 40) {
                    StatItem(value: profile.postCount, label: "投稿")
                    StatItem(value: profile.followerCount, label: "フォロワー")
                    StatItem(value: profile.followingCount, label: "フォロー中")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // アクションボタン
                HStack(spacing: 20) {
                    Button(action: {
                        // フォローアクション
                    }) {
                        Text("プロフィール編集")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // メッセージアクション
                    }) {
                        Text("ログアウト")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                // 投稿グリッドセクション
                List{
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 2),
                        GridItem(.flexible(), spacing: 2),
                        GridItem(.flexible(), spacing: 2)
                    ], spacing: 2) {
                        ForEach(0..<21, id: \.self) { index in
                            Image("avatar2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 120)
                                .clipped()
                        }
                        .border(Color.gray.opacity(0.1), width: 3)
                    }
                }
            }
            .navigationBarItems(
                leading: Text("プロフィール")
                    .font(.headline)
            )
        }
    }
    // 統計アイテムのカスタムビュー
    struct StatItem: View {
        let value: Int
        let label: String
        
        var body: some View {
            VStack {
                Text("\(value)")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
