//
//  Video.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 01/07/25.
//

struct VideoItem: Identifiable,Decodable {
    let id: String
    let title: String
    let description: String
    let duration: String
    let thumbnailURL: String
    let videoURL: String
}
