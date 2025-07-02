//
//  VideoPlayerView.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 02/07/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView : View {
    
    let video:VideoItem
    @StateObject var viewModel: VideoPlayerViewModel
    
    init(video:VideoItem){
        self.video  = video
        _viewModel = StateObject(wrappedValue:VideoPlayerViewModel(video: video))
    }
    
    var body: some View {
        VideoPlayerControllerRepresentable(player: viewModel.getPlayer())
            .onDisappear{
                viewModel.cleanup()
            }
            .navigationTitle(video.title)
            .edgesIgnoringSafeArea(.all)
    }
}
