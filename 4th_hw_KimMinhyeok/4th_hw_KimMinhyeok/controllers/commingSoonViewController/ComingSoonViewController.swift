//
//  ViewController.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/28.
//

import UIKit

class ComingSoonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        setUI()
        fetchTMDBData()
    }
    
    private let contentService = ContentService()
    private var movies: [ContentModel] = []
    
    let header = ComingSoonHeaderView()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    func setUI() {
        navigationController?.navigationBar.addSubview(header)
    }
    
    func updateUI(with movies: [ContentModel]?) {
        // tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ComingSoonTableCellView.self, forCellReuseIdentifier: "Cell")
     
        view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            // tableView
            tableView.topAnchor.constraint(equalTo: navigationController?.navigationBar.bottomAnchor ?? view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    private func fetchTMDBData() {
        contentService.fetchMovies(category: "Upcoming Movies") {[weak self] moviesOfCategory, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching TMDB data for Up Coming Movies: \(error)")
                return
            }
            
            // 영화 데이터 업데이트
            if let moviesOfCategory = moviesOfCategory {
                self.movies = moviesOfCategory
                DispatchQueue.main.async {
                    self.updateUI(with: self.movies)
                }
            }
        }
    }
}

extension ComingSoonViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ComingSoonTableCellView else {
            return UITableViewCell()
        }
        
        if movies.indices.contains(indexPath.item) {
            // celld
            let content = movies[indexPath.item]
            let backdropURL = content.backdropURL
            let date = content.releaseDate
            let title = content.title
            let description = content.overview
            // genreId들을 해당 문자열로 바꾸기
            let genres = content.genreIds.compactMap{ ContentService.genreMapping[$0] }
            // genre들을 " · "와 함께 이어붙여서 하나의 string으로 만들기
            let kewords = genres.joined(separator: " · ")
            
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: backdropURL) {
                    DispatchQueue.main.async {
                        cell.cellImageView.image = UIImage(data: imageData)
                        cell.dateLabel.text = date
                        cell.titleLabel.text = title
                        cell.descriptionLabel.text = description
                        cell.keywordLabel.text = kewords
                    }
                }
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        411.0
    }
}


