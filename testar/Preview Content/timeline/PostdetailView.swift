//
//  Postdetail.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/14.
//

import SwiftUI

struct PostdetailView: View {
    let post: Post
    @State private var isLiked: Bool
    @State private var isRetweeted: Bool
    @State private var retweets: Int
    @State private var likes: Int
    @State private var imageheight = 400.0
    init(post: Post) {
            self.post = post
            _isLiked = State(initialValue: post.islikes)
            _isRetweeted = State(initialValue: post.isretweets)
            _retweets = State(initialValue: post.retweets)
            _likes = State(initialValue: post.likes)
        }
    
    var body: some View {
        VStack(alignment: .leading){
                Image(post.avatarName)
                    .resizable()
                    .frame(width: imageheight, height: imageheight)
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
                HStack(spacing: 55) {
                    // コメント
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "message")
                            Text("\(post.comments)")
                                .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                    .foregroundColor(.gray)
                    
                    // リツイート
                    Button(action: {
                        isRetweeted.toggle()
                        if isRetweeted == true{
                            retweets += 1
                        }
                        else{
                            retweets -= 1
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.2.squarepath")
                            Text("\(retweets)")
                                .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                    .foregroundColor(isRetweeted ? .green : .gray)
                    
                    // いいね
                    Button(action: {
                        isLiked.toggle()
                        if isLiked == true{
                            likes += 1
                        }
                        else{
                            likes -= 1
                        }
                    }) {
                        HStack {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                            Text("\(likes)")
                                .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                    .foregroundColor(isLiked ? .red : .gray)
                    
                    // シェア
                    ShareLink("", item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
                        .foregroundColor(.gray)
                }
                .font(.subheadline)
            }
            .padding()
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
                                 isretweets: false))
    }
}

