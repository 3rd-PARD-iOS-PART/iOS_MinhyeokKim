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
    
    
    let tableViewUI: UITableView = {
        let tableVIew = UITableView()
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        return tableVIew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        setUI()
        fetchMembers()
        
        headerView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    func setUI(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.addSubview(tableViewUI)
        
        tableViewUI.register(MemberTableViewCellView.self, forCellReuseIdentifier: "Cell")
        
        tableViewUI.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            tableViewUI.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
    
    // 멤버 가져오기
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
                            self.tableViewUI.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨🚨🚨", error)
                    }
                }
            }
            task.resume()
        }
    }
    
    // 추가 페이지 모달 이동
    @objc func addButtonTapped() {
        let addMemberViewController = AddMemberViewController(homeViewController: self)
        self.present(addMemberViewController, animated: true, completion: nil)
    }
    
}

// tableView 설정
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MemberTableViewCellView else {
            return UITableViewCell()
        }
        
        let member = members[indexPath.row]
        cell.configure(with: member)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        
        let detailViewController = DetailViewController()
        detailViewController.member = member
        detailViewController.homeViewController = self
        
        let navController = UINavigationController(rootViewController: detailViewController)
        navController.modalPresentationStyle = .fullScreen
        
        present(navController, animated: true, completion: nil)
    }
    
}
