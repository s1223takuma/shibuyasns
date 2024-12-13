//
//  timelineView.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/12.
//

import SwiftUI
struct TimelineView: View {
    var authenticationManager = AuthenticationManager()
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                        ZStack{
                            
                            NavigationLink(destination: PostdetailView(post: post)) {EmptyView()}
                                .padding(10)
                                .opacity(0)
                            VStack{
                                PostCardView(
                                    post: post,
                                    isLiked: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].islikes,
                                    isRetweeted: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].isretweets,
                                    retweets: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].retweets,
                                    likes: $viewModel.posts[viewModel.posts.firstIndex(where: { $0.id == post.id })!].likes
                                )
                                Divider()
                                    .padding(5)
                                
                            }
                        
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                }
                
                Button("ログアウト") {
                            authenticationManager.signOut()
                        }
            }
            .listStyle(PlainListStyle())
            .background(Color(.systemBackground))
            .navigationBarTitleDisplayMode(.inline)
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

