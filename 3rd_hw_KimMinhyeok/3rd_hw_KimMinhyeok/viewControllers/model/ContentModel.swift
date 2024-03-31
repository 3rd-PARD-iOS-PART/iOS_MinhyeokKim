//
//  ContentModel.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/29.
//

import Foundation

// category: sectionTitle, image: cell
struct ContentModel{
    var category : String
    var image : String
}

#if DEBUG

extension ContentModel{
    
    // CollectionViews data
    static var ContentModelData = [
        // 첫 번째 섹션
        [
            ContentModel(category: "Popular on Netflix", image: "movie1"),
            ContentModel(category: "Popular on Netflix", image: "movie2"),
            ContentModel(category: "Popular on Netflix", image: "movie3"),
            ContentModel(category: "Popular on Netflix", image: "movie4"),
            ContentModel(category: "Popular on Netflix", image: "movie5"),
            ContentModel(category: "Popular on Netflix", image: "movie6"),
        ],
        // 두 번째 섹션
        [
            ContentModel(category: "Trending Now", image: "movie7"),
            ContentModel(category: "Trending Now", image: "movie8"),
            ContentModel(category: "Trending Now", image: "movie9"),
            ContentModel(category: "Trending Now", image: "movie10"),
            ContentModel(category: "Trending Now", image: "movie11"),
            ContentModel(category: "Trending Now", image: "movie12"),
        ],
        // 세 번째 섹션
        [
            ContentModel(category: "Top 10 in Nigeria Today", image: "movie13"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "movie14"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "movie15"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "movie16"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "movie17"),
            ContentModel(category: "Top 10 in Nigeria Today", image: "movie18"),
        ],
        // 네 번째 섹션
        [
            ContentModel(category: "My List", image: "movie19"),
            ContentModel(category: "My List", image: "movie20"),
            ContentModel(category: "My List", image: "movie21"),
            ContentModel(category: "My List", image: "movie22"),
            ContentModel(category: "My List", image: "movie23"),
            ContentModel(category: "My List", image: "movie24"),
        ],
        // 다섯 번째 섹션
        [
            ContentModel(category: "African Movies", image: "movie25"),
            ContentModel(category: "African Movies", image: "movie26"),
            ContentModel(category: "African Movies", image: "movie27"),
            ContentModel(category: "African Movies", image: "movie28"),
            ContentModel(category: "African Movies", image: "movie29"),
            ContentModel(category: "African Movies", image: "movie30"),
        ],
        // 여섯 번째 섹션
        [
            ContentModel(category: "Nollywood Movies & TV", image: "movie31"),
            ContentModel(category: "Nollywood Movies & TV", image: "movie32"),
            ContentModel(category: "Nollywood Movies & TV", image: "movie33"),
            ContentModel(category: "Nollywood Movies & TV", image: "movie34"),
            ContentModel(category: "Nollywood Movies & TV", image: "movie35"),
            ContentModel(category: "Nollywood Movies & TV", image: "movie36"),
        ],
    ]
}
#endif

