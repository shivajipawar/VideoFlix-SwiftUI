//
//  VideoListView.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 02/07/25.
//

import SwiftUI

struct VideoListView : View {
    
    @StateObject private var viewModel = VideoListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                Group{
                    if viewModel.isLoading {
                        ProgressView("Fetching Videos...")
                            .progressViewStyle(CircularProgressViewStyle())
                    } else if let error = viewModel.error {
                        VStack {
                            Text("⚠️ \(error)")
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Button(action: {
                                viewModel.fetchVideos()
                            }) {
                                Text("Retry")
                                    .bold()
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    } else if viewModel.videos.isEmpty {
                        Text("No videos available.")
                            .foregroundColor(.secondary)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(viewModel.videos) { video in
                                    NavigationLink(destination: VideoPlayerView(video: video)) {
                                        VideoCardView(video: video)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationTitle("🎬 VideoFlix")
        .onAppear{
            viewModel.fetchVideos()
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

