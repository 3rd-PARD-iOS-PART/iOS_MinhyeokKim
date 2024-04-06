//
//  ViewController.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/28.
//

import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        setUI()
        fetchTMDBData()
    }
    
    private let contentService = ContentService()
    private var movies: [ContentModel] = []
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.backgroundColor = UIColor.gray
        searchBar.searchTextField.textColor = UIColor.white
        searchBar.placeholder = "Search for a show, movie, genre, e.t.c."
        // placeholder style
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: searchBar.placeholder ?? "", attributes: placeholderAttributes)
        // searchButton style
        if let leftImageView = searchBar.searchTextField.leftView as? UIImageView {
            leftImageView.image = leftImageView.image?.withRenderingMode(.alwaysTemplate)
            leftImageView.tintColor = UIColor.lightGray
        }
        return searchBar
    }()
    
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
        // searchBar
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func updateUI(with movies: [ContentModel]?) {
        // tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchTableCellView.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            // tableView
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    private func fetchTMDBData() {
        contentService.fetchMovies(category: "Top Rated Movies") {[weak self] moviesOfCategory, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching TMDB data for Top Rated Movies: \(error)")
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 검색을 실행하는 로직을 여기에 추가
        if let searchText = searchBar.text {
            print("검색어: \(searchText)")
        }
        searchBar.resignFirstResponder() // 키보드 숨기기
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SearchTableCellView else {
            return UITableViewCell()
        }
        
        if movies.indices.contains(indexPath.item) {
            let content = movies[indexPath.item]
            let title = content.title
            let backdropURL = content.backdropURL
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: backdropURL) {
                    DispatchQueue.main.async {
                        cell.label.text = title
                        cell.cellImageView.image = UIImage(data: imageData)
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
        76.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        55.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // headerView
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        // header Title
        let headerTitle = UILabel()
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.text = "Top Searches"
        headerTitle.font = UIFont.systemFont(ofSize: 26.75, weight: .bold)
        headerTitle.textColor = UIColor.white
        
        headerView.addSubview(headerTitle)
        
        NSLayoutConstraint.activate([
            headerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
        ])
        
        return headerView
    }
}

