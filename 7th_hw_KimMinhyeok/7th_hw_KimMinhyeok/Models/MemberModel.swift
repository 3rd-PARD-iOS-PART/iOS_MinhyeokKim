//
//  MemberModel.swift
//  7th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/11.
//

import Foundation

struct MemberModel: Decodable, Encodable {
    var id: Int?
    var name: String
    var part: String
    var age: Int
    
    init(name: String, part: String, age: Int) {
        self.id = nil // ID는 새로운 멤버를 추가할 때 nil로 설정됩니다.
        self.name = name
        self.part = part
        self.age = age
    }
}
