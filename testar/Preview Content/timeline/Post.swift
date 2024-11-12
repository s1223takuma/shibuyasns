//
//  post.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/12.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let handle: String
    let avatarName: String
    let content: String
    let timeAgo: String
    var comments: Int
    var retweets: Int
    var likes: Int
}
