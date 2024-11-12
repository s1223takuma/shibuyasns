//
//  PostViewModel.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/12.
//

import SwiftUI

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = [
        Post(username: "田中太郎",
             handle: "taro_tanaka",
             avatarName: "avatar1",
             content: "今日は素晴らしい天気ですね！公園でピクニックするのにぴったりです 🌸",
             timeAgo: "2時間前",
             comments: 12,
             retweets: 34,
             likes: 89),
        Post(username: "山田花子",
             handle: "hanako_yamada",
             avatarName: "avatar2",
             content: "新しいプロジェクトが始まりました！とてもワクワクしています ✨ みなさんも応援よろしくお願いします！",
             timeAgo: "3時間前",
             comments: 8,
             retweets: 15,
             likes: 67),
        Post(username: "鈴木一郎",
             handle: "ichiro_suzuki",
             avatarName: "avatar3",
             content: "美味しいラーメンを見つけました🍜 また来週も来よう！",
             timeAgo: "5時間前",
             comments: 23,
             retweets: 45,
             likes: 156),
        Post(username: "鈴木一郎",
             handle: "ichiro_suzuki",
             avatarName: "avatar3",
             content: "美味しいラーメンを見つけました🍜 また来週も来よう！",
             timeAgo: "5時間前",
             comments: 23,
             retweets: 45,
             likes: 156),
        Post(username: "鈴木一郎",
             handle: "ichiro_suzuki",
             avatarName: "avatar3",
             content: "美味しいラーメンを見つけました🍜 また来週も来よう！",
             timeAgo: "5時間前",
             comments: 23,
             retweets: 45,
             likes: 156),
        Post(username: "鈴木一郎",
             handle: "ichiro_suzuki",
             avatarName: "avatar3",
             content: "美味しいラーメンを見つけました🍜 また来週も来よう！",
             timeAgo: "5時間前",
             comments: 23,
             retweets: 45,
             likes: 156),
    ]
}
