//
//  PostCardView.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/12.
//

import SwiftUI

struct PostCardView: View {
    let post: Post
    @Binding var isLiked: Bool
    @Binding var isRetweeted: Bool
    @Binding var retweets: Int
    @Binding var likes: Int
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
            }
                .background(Color.white)
            Image(post.avatarName)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .ignoresSafeArea()
                .opacity(0.5)
                .padding(10)
            VStack(alignment: .leading, spacing: 10) {
                // ユーザー情報
                HStack(alignment: .top, spacing: 10) {
                    Image(post.avatarName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 4) {
                            Text(post.username)
                                .font(.headline)
                                .lineLimit(1)
                            
                            Text("@\(post.handle)")
                                .foregroundColor(.gray)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text(post.timeAgo)
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Text(post.content)
                            .font(.body)
                            .lineLimit(3)
                    }
                }
                .padding(.horizontal)
                
            }
            
            .padding(.vertical, 10)
        }
    }
    
    @ViewBuilder
    func actionButton(systemName: String, count: Int, color: Color, action: (() -> Void)? = nil) -> some View {
        Button(action: action ?? {}) {
            HStack(spacing: 4) {
                Image(systemName: systemName)
                Text("\(count)")
            }
        }
        .foregroundColor(color)
            }

}
struct PostcardView_Previews: PreviewProvider {
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
