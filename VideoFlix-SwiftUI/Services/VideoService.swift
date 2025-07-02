//
//  VideoService.swift
//  VideoFlix
//
//  Created by Shivaji N. Pawar on 01/07/25.
//

import Foundation

protocol VideoServiceProtocol{
    func fetchVideoList(completion:@escaping (Result<[VideoItem], Error>) -> Void)
}

class VideoService:VideoServiceProtocol {
    
    func fetchVideoList(completion: @escaping (Result<[VideoItem], Error>) -> Void){
        
        guard let url = Bundle.main.url(forResource: "video_list", withExtension: "json"),
              let data = try? Data.init(contentsOf: url),
              let videos = try? JSONDecoder().decode([VideoItem].self, from: data)
        else {
            completion(.failure(NSError(domain: "missing_file", code: 404)))
            return
        }
        completion(.success(videos))
    }
}
