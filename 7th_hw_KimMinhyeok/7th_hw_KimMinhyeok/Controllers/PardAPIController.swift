//
//  File.swift
//  7th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/11.
//

import Foundation

class PardAPIController {
    
    static let shared = PardAPIController()
    
    let baseURL = "https://pard-host.onrender.com/pard"
    
    func getMembers(completion: @escaping ([MemberModel]?, Error?) -> Void) {
        if let url = URL(string: "\(baseURL)") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                if let jsonData = data {
                    do {
                        let decoder = JSONDecoder()
                        let members = try decoder.decode([MemberModel].self, from: jsonData)
                        completion(members, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            }
            task.resume()
        }
    }
    
    func getMembersByPart(part: String, completion: @escaping ([MemberModel]?, Error?) -> Void) {
        let urlString = "\(baseURL)?part=\(part)"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data returned", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let members = try decoder.decode([MemberModel].self, from: data)
                completion(members, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func getMemberById(memberId: Int, completion: @escaping (MemberModel?, Error?) -> Void) {
        let urlString = "\(baseURL)/\(memberId)"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data returned", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let member = try decoder.decode(MemberModel.self, from: data)
                completion(member, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func postMemberData(member: MemberModel, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(member)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(error)
                    return
                }
                completion(nil)
            }
            task.resume()
        } catch {
            completion(error)
        }
    }
    
    func deleteMemberById(memberId: Int, completion: @escaping (Error?) -> Void) {
        let urlString = "\(baseURL)/\(memberId)"
        
        guard let url = URL(string: urlString) else {
            completion(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
        task.resume()
    }
}

