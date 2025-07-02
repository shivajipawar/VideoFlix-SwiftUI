//
//  VideoCardView.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 02/07/25.
//

import SwiftUI

struct VideoCardView : View {
    
    let video:VideoItem
    
    var body: some View {
        
        HStack(spacing: 16){
            AsyncImage(url: URL(string: video.thumbnailURL)){ phase in
                switch phase{
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 60)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .transition(.opacity)
                case .failure:
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                    
                }
            }
            
            Text(video.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
