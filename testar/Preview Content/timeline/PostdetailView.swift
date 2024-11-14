//
//  Postdetail.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/14.
//

import SwiftUI

struct PostdetailView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // ユーザー情報
            HStack(spacing: 12) {
                Image(post.avatarName)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(post.username)
                            .font(.headline)
                        
                        Text("@\(post.handle)")
                            .foregroundColor(.gray)
                        
                        Text("・")
                            .foregroundColor(.gray)
                        
                        Text(post.timeAgo)
                            .foregroundColor(.gray)
                    }
                    
                    Text(post.content)
                        .font(.body)
                }
            }
            
            // アクションボタン
            HStack(spacing: 32) {
                // コメント
                Button(action: {}) {
                    HStack {
                        Image(systemName: "message")
                        Text("\(post.comments)")
                    }
                }
                .foregroundColor(.gray)
                
                // リツイート
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "arrow.2.squarepath")
                        Text("\(post.retweets)")
                    }
                }
                .foregroundColor(post.isretweets ? .green : .gray)
                
                // いいね
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: post.islikes ? "heart.fill" : "heart")
                        Text("\(post.likes)")
                    }
                }
                .foregroundColor(post.islikes ? .red : .gray)
                
                // シェア
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
                .foregroundColor(.gray)
            }
            .font(.subheadline)
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

struct PostdetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostdetailView(post:Post(username: "鈴木一郎",
                                 handle: "ichiro_suzuki",
                                 avatarName: "avatar3",
                                 content: "美味しいラーメンを見つけました🍜 また来週も来よう！",
                                 timeAgo: "5時間前",
                                 comments: 23,
                                 retweets: 45,
                                 likes: 156,
                                 islikes: true,
                                 isretweets: true))
    }
}
