//
//  AddViewController.swift
//  7th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/11.
//

import UIKit

class AddViewController: UIViewController {
    
    let nameTextField = TextFieldView()
    let ageTextField = TextFieldView()
    let partTextField = TextFieldView()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var homeViewController: HomeViewController?
    
    init(homeViewController: HomeViewController) {
        self.homeViewController = homeViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        nameTextField.setPlaceHolder("이름을 입력해주세요")
        ageTextField.setPlaceHolder("나이를 입력해주세요")
        partTextField.setPlaceHolder("파트를 입력해주세요")
        
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField, ageTextField, partTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    // 추가 Button 설정
    @objc func submitButtonTapped() {
        // submit validation 설정
        guard let name = nameTextField.text, !name.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText), age > 0,
              let part = partTextField.text, !part.isEmpty else {
            // 필수 입력 필드에 내용이 비어있거나 나이가 0 이하일 때
            showToast(message: "모든 필드가 채워져야 하며, 나이는 0보다 커야 합니다.")
            return
        }
        
        let newMember = MemberModel(name: name, part: part, age: age)
        postMemberData(newMember)
    }
    
    // 멤버 추가
    func postMemberData(_ member: MemberModel) {
        PardAPIController.shared.postMemberData(member: member) { error in
            if let error = error {
                print("Error posting member data: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.homeViewController?.fetchMembers()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension UIViewController {
    // toast
    func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 16.0)
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        let toastWidth = toastLabel.intrinsicContentSize.width + 20
        let toastHeight = toastLabel.intrinsicContentSize.height + 20
        toastLabel.frame = CGRect(x: self.view.frame.size.width / 2 - (toastWidth / 2),
                                  y: self.view.frame.size.height - (toastHeight * 2),
                                  width: toastWidth, height: toastHeight)
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {_ in
                toastLabel.removeFromSuperview()
            })
        })
    }
}

