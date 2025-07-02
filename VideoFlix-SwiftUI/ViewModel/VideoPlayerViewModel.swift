//
//  VideoPlayerViewModel.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 02/07/25.
//

import Foundation
import AVFoundation

class VideoPlayerViewModel : ObservableObject{
    private let video: VideoItem
    private let player: AVPlayer
    private let storage: PlaybackStorageServiceProtocol
    
    init(video: VideoItem,
         storage: PlaybackStorageServiceProtocol = PlaybackStorageService()) {
        self.video = video
        self.storage = storage
        self.player = AVPlayer(url: URL(string: video.videoURL)!)
    }
    
    func saveCurrentTime(){
        let currentTime = player.currentTime().seconds
        storage.savePlaybackTime(for: video.id, time: currentTime)
    }
    
    func getPlayer () -> AVPlayer {
        if let resumeTime = storage.getPlaybackTime(for: video.id){
            let cmTime = CMTime(seconds: resumeTime, preferredTimescale: 1)
            player.seek(to: cmTime)
        }
        return player
    }
    
    func cleanup() {
           saveCurrentTime()
           player.pause()
           player.replaceCurrentItem(with: nil)
       }
}
