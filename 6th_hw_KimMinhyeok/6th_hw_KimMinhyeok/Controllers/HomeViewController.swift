//
//  HomeViewController.swift
//  6th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    var members: [MemberModel] = []
    static let URL_GET_MEMBERS = "https://pard-host.onrender.com/pard"
    
    let headerView = HeaderView()
    
    let memberTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        memberTableView.dataSource = self
        memberTableView.delegate = self
        
        setUI()
        fetchMembers()
    }
    
    func setUI() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.addSubview(memberTableView)
        
        memberTableView.register(MemberTableViewCellView.self, forCellReuseIdentifier: "Cell")
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            memberTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            memberTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            memberTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -14),
            memberTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func fetchMembers() {
        if let url = URL(string: HomeViewController.URL_GET_MEMBERS) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("🚨🚨🚨", error!)
                    return
                }
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    
                    let decoder = JSONDecoder()
                    do {
                        self.members = try decoder.decode([MemberModel].self, from: JSONdata)
                        DispatchQueue.main.async {
                            self.memberTableView.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨🚨🚨", error)
                    }
                }
            }
            task.resume()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowInSection")
        let count = members.count
        print(count)
        // 데이터가 없을 때 콘솔에 메시지 출력
        if count == 0 {
            print("데이터가 없습니다.")
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        guard let cell = memberTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MemberTableViewCellView else {
            return UITableViewCell()
        }
        let member = members[indexPath.row]
        cell.configure(with: member)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("heightForRowAt")
        return 100
    }
}



