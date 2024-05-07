//
//  VideoModel.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/14.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
