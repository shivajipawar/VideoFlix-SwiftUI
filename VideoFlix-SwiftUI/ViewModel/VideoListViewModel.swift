//
//  VideoListViewModel.swift
//  VideoFlix-SwiftUI
//
//  Created by Shivaji N. Pawar on 02/07/25.
//

import Foundation

class VideoListViewModel:ObservableObject{
    
    @Published var videos : [VideoItem] = []
    @Published var isLoading:Bool = false
    @Published var error:String?
    private let service : VideoServiceProtocol
    
    
    init(service: VideoServiceProtocol = VideoService()) {
        self.service = service
    }
    
    func fetchVideos(){
        isLoading = true
        service.fetchVideoList { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch(result){
                case .success(let videos):
                    self?.videos = videos
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
