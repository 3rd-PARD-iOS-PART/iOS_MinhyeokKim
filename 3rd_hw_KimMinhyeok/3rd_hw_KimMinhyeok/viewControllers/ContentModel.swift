//
//  ContentModel.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/29.
//

import Foundation

struct ContentModel{
    var category : String
    var image : String
}

#if DEBUG

extension ContentModel{
    
    static var ContentModelData = [
        [
            ContentModel(category: "Popular on Netflix", image: "pard"),
            ContentModel(category: "Popular on Netflix", image: "apple"),
            ContentModel(category: "Popular on Netflix", image: "pard"),
            ContentModel(category: "Popular on Netflix", image: "apple"),
            ContentModel(category: "Popular on Netflix", image: "pard"),
            ContentModel(category: "Popular on Netflix", image: "apple"),
            ContentModel(category: "Popular on Netflix", image: "pard"),
            ContentModel(category: "Popular on Netflix", image: "apple"),
            ContentModel(category: "Popular on Netflix", image: "pard"),
            
        ],
        [
            ContentModel(category: "Trending Now", image: "bear"),
            ContentModel(category: "Trending Now", image: "flower"),
            ContentModel(category: "Trending Now", image: "bear"),
            ContentModel(category: "Trending Now", image: "flower"),
            ContentModel(category: "Trending Now", image: "bear"),
            ContentModel(category: "Trending Now", image: "flower"),
            ContentModel(category: "Trending Now", image: "bear"),
            ContentModel(category: "Trending Now", image: "flower"),
            ContentModel(category: "Trending Now", image: "bear"),
            ContentModel(category: "Trending Now", image: "flower"),
            ContentModel(category: "Trending Now", image: "bear"),
            ContentModel(category: "Trending Now", image: "flower"),
        ],
        [   
            ContentModel(category: "Top 10 in Nigeria Today", image: "bear"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "flower"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "bear"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "flower"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "bear"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "flower"),
        ],
        [
            ContentModel(category: "My List", image: "pard"),
            ContentModel(category: "My List", image: "apple"),
            ContentModel(category: "My List", image: "pard"),
            ContentModel(category: "My List", image: "apple"),
            ContentModel(category: "My List", image: "pard"),
            ContentModel(category: "My List", image: "apple"),
            ContentModel(category: "My List", image: "pard"),
            ContentModel(category: "My List", image: "apple"),
            ContentModel(category: "My List", image: "pard"),
            
        ],
        [
            ContentModel(category: "African Movies", image: "bear"),
            ContentModel(category: "African Movies", image: "flower"),
            ContentModel(category: "African Movies", image: "bear"),
            ContentModel(category: "African Movies", image: "flower"),
            ContentModel(category: "African Movies", image: "bear"),
            ContentModel(category: "African Movies", image: "flower"),
        ],
        [
            ContentModel(category: "Nollywood Movies & TV", image: "bear"),
            ContentModel(category: "Nollywood Movies & TV", image: "flower"),
            ContentModel(category: "Nollywood Movies & TV", image: "bear"),
            ContentModel(category: "Nollywood Movies & TV", image: "flower"),
            ContentModel(category: "Nollywood Movies & TV", image: "bear"),
            ContentModel(category: "Nollywood Movies & TV", image: "flower"),
        ],
    ]
}
#endif
