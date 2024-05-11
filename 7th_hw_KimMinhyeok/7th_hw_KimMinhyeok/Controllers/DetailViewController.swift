//
//  DetailViewController.swift
//  7th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/11.
//

import UIKit

class DetailViewController: UIViewController {
    
    var memberId: Int?
    var member: MemberModel?
    var homeViewController: HomeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let memberId = memberId {
            fetchMemberById(memberId: memberId)
        }
    }
    
    func fetchMemberById(memberId: Int) {
        PardAPIController.shared.getMemberById(memberId: memberId) { member, error in
            if let error = error {
                print("Error fetching member: \(error)")
                return
            }
            
            if let member = member {
                self.member = member
                DispatchQueue.main.async {
                    self.setupUI()
                }
            }
        }
    }
    func setupUI() {
        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteButtonTapped))
        navigationItem.leftBarButtonItem = deleteButton
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.rightBarButtonItem = editButton
        
        // 이름, 나이, 파트 라벨 표시
        let nameLabel = UILabel()
        nameLabel.text = member?.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let ageLabel = UILabel()
        ageLabel.text = "Age: \(member?.age ?? 0)"
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let partLabel = UILabel()
        partLabel.text = "Part: \(member?.part ?? "")"
        partLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(partLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            partLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            partLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageLabel.bottomAnchor.constraint(equalTo: partLabel.topAnchor, constant: -4)
        ])
    }
    
    // Delete 버튼 동작 구현
    @objc func deleteButtonTapped() {
        let alertController = UIAlertController(title: "정말로 삭제하시겠습니까?", message: "삭제한 내용은 다시 되돌릴 수 없습니다.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            // 확인 버튼을 누르면 해당 멤버를 삭제하고 홈 뷰를 업데이트
            if let memberId = self.memberId {
                self.deleteMember(memberId: memberId)
            }
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Edit 버튼 동작 구현
    @objc func editButtonTapped() {
        // 아무 동작 없음
    }
    
    func deleteMember(memberId: Int) {
        PardAPIController.shared.deleteMemberById(memberId: memberId) { error in
            if let error = error {
                print("Error deleting member: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.homeViewController?.fetchMembers()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}


