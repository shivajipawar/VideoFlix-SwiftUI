//
//  PlaybackStorageService.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 02/07/25.
//

import Foundation

protocol PlaybackStorageServiceProtocol{
    func savePlaybackTime(for videoID: String, time: Double)
    func getPlaybackTime(for videoID: String) -> Double?
}

class PlaybackStorageService: PlaybackStorageServiceProtocol{
    
    private let keyPrefix = "playback_time_"
    func savePlaybackTime(for videoID: String, time: Double){
        UserDefaults.standard.set(time, forKey: keyPrefix + videoID)
    }
    func getPlaybackTime(for videoID: String) -> Double?{
        UserDefaults.standard.double(forKey: keyPrefix + videoID)
    }
}
