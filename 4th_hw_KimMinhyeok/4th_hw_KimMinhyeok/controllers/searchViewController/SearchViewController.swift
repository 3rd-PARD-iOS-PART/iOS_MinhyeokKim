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
        updateUI()
    }
    
    private let contentService = ContentService()
    private var fetchedMovies: [ContentModel] = []
    private var moviesForView: [ContentModel] = []
    
    private lazy var searchBar: UISearchBar = {
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
    
    func updateUI() {
        self.tableView.reloadData()
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
                self.fetchedMovies = moviesOfCategory
                self.moviesForView = self.fetchedMovies
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterItems(with: searchText)
        self.updateUI()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // 취소 버튼을 누를 때 검색어를 초기화하고 테이블 뷰를 갱신
        searchBar.text = nil
        searchBar.resignFirstResponder() // 키보드 내림
        filterItems(with: "")
        self.updateUI()
    }
    
    private func filterItems(with searchText: String) {
        if searchText.isEmpty {
            // 검색어가 비어있으면 모든 항목을 포함
            moviesForView = fetchedMovies
        } else {
            // 검색어를 기준으로 items 배열을 필터링하여 검색 결과를 moviesForView에 저장
            moviesForView = fetchedMovies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesForView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SearchTableCellView else {
            return UITableViewCell()
        }
        
        if moviesForView.indices.contains(indexPath.item) {
            let content = moviesForView[indexPath.item]
            let title = content.title
            let backdropURL = content.backdropURL
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: backdropURL),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        cell.label.text = title
                        cell.cellImageView.image = image
                    }
                } else {
                    print("Failed to load image from URL: \(backdropURL)")
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

