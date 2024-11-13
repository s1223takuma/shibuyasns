//
//  timelineView.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/12.
//

import SwiftUI
struct TimelineView: View {
    @StateObject private var viewModel = PostViewModel()
    
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
                Button(action: {}) {
                    HStack {
                        Image(systemName: "message")
                    }
                }

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
