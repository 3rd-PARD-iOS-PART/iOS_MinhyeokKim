//
//  HomeViewController.swift
//  7th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/11.
//

import UIKit

class HomeViewController: UIViewController {
    var members: [MemberModel] = []
    
    let filter: [String] = ["all", "iOS", "server", "web"]
    // 선택된 파트 셀 배경색 바꿔주기 위함
    var selectedIndexPath: IndexPath = IndexPath(item: 0, section: 0)
    
    let headerView = HeaderView()
    
    let partFilterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    let tableViewUI: UITableView = {
        let tableVIew = UITableView()
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        return tableVIew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        partFilterCollectionView.dataSource = self
        partFilterCollectionView.delegate = self
        
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        
        fetchMembers()
        setUI()
        
        headerView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    func setUI(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.addSubview(partFilterCollectionView)
        view.addSubview(tableViewUI)
        
        partFilterCollectionView.register(PartFilterCell.self, forCellWithReuseIdentifier: "PartFilterCell")
        tableViewUI.register(MemberTableViewCellView.self, forCellReuseIdentifier: "Cell")
        
        tableViewUI.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            partFilterCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            partFilterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            partFilterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            partFilterCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            tableViewUI.topAnchor.constraint(equalTo: partFilterCollectionView.bottomAnchor),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // 멤버 가져오기
    func fetchMembers() {
        PardAPIController.shared.getMembers { members, error in
            if let error = error {
                print("Error fetching members: \(error)")
                return
            }
            
            if let members = members {
                self.members = members
                DispatchQueue.main.async {
                    self.tableViewUI.reloadData()
                }
            }
        }
    }
    
    func fetchMembersByPart(part: String) {
        PardAPIController.shared.getMembersByPart(part: part) { members, error in
            if let error = error {
                print("Error fetching members: \(error)")
                return
            }
            
            if let members = members {
                self.members = members
                DispatchQueue.main.async {
                    self.tableViewUI.reloadData()
                }
            }
        }
    }
    
    // 추가 페이지 모달 이동
    @objc func addButtonTapped() {
        let addViewController = AddViewController(homeViewController: self)
        self.present(addViewController, animated: true, completion: nil)
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
        detailViewController.memberId = member.id
        detailViewController.homeViewController = self
        
        let navController = UINavigationController(rootViewController: detailViewController)
        navController.modalPresentationStyle = .automatic
        
        present(navController, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartFilterCell", for: indexPath) as! PartFilterCell
        
        // 셀의 버튼의 타이틀을 설정합니다
        cell.partLabel.text = filter[indexPath.item]
        
        if indexPath.item == selectedIndexPath.item {
            cell.partLabel.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            cell.partLabel.layer.backgroundColor = UIColor.white.cgColor
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 각 셀의 크기를 반환합니다
        return CGSize(width: 120, height: 60) // 필요에 따라 조정합니다
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let previousCell = collectionView.cellForItem(at: selectedIndexPath) as? PartFilterCell {
            previousCell.partLabel.layer.backgroundColor = UIColor.white.cgColor
        }
        
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? PartFilterCell {
            selectedCell.partLabel.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        
        // 선택된 셀의 indexPath를 저장합니다.
        selectedIndexPath = indexPath
        
        selectedIndexPath = indexPath
        
        // 선택된 파트에 따라 멤버 목록을 필터링
        if indexPath.item == 0 {
            fetchMembers()
        } else {
            fetchMembersByPart(part: filter[indexPath.item])
        }
    }
}

