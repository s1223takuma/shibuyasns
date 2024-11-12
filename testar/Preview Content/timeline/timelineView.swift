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
                        PostCardView(post: post)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("タイムライン")
        }
    }
}
