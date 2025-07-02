//
//  VideoPlayerRepresentable.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 02/07/25.
//

import Foundation
import AVKit
import SwiftUI

struct VideoPlayerControllerRepresentable: UIViewControllerRepresentable{
    
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.player?.play()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}
