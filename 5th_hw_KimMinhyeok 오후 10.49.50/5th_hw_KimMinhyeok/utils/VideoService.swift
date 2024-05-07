//
//  VideoService.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/14.
//

import Foundation
import Combine

class VideoService {
    private let YoutubeAPI_KEY = "AIzaSyBKejykbUPl5UebOQCCST_HIQl0HS-t64Y"
    private let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    
    
    
    // 유투브API에서 비디오 가져오기
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(YoutubeBaseURL)q=\(query)&key=\(YoutubeAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
