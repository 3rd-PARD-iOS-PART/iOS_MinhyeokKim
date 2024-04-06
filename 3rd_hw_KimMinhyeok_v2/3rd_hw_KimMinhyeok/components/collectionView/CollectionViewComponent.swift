//
//  SectionComponent.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/30.
//

import UIKit

// Sets of SectionHeader & CollectionView
class CollectiViewComponent: UIView {
    private let contentService = ContentService()
    private var movies: [[ContentModel]] = []
    let categories = ["Popular Movies", "Now Playing Movies", "Upcoming Movies", "Top Rated Movies", "Trending Movies"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        fetchTMDBData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // UI 설정
    }
    
    private func fetchTMDBData() {
        var _: [ContentModel]
        for category in categories {
            contentService.fetchMovies(category: category) {[weak self]  moviesOfCategory, error in
                guard let self = self else { return }
                if let error = error {
                    print("Error fetching TMDB data for \(category): \(error)")
                    return
                }
                
                // 카테고리 별로 받아온 일차원 배열을 이차원 배열 movies에 추가
                self.movies.append(moviesOfCategory ?? [])
            }
        }
        DispatchQueue.main.async {
            self.updateUI(with: self.movies)
        }
    }

    private func updateUI(with movies: [[ContentModel]]?) {
        guard let movies = movies else {
            print("No movies data to update UI for \(categories)")
            return
        }
        
        // number of sections
        let numberOfCollectionViews = movies.count
        // 이전 section을 통해 autolayout 잡아주기 위함
        var previousSection: UICollectionView?
        
        for index in 0..<numberOfCollectionViews {
            let sectionHeader = SectionHeaderComponent()
            sectionHeader.translatesAutoresizingMaskIntoConstraints = false
            // section의 첫 item의 category값으로 sectionHeader title 지정
            sectionHeader.category.text = movies[index].first?.category
            
            let collectionView: UICollectionView = {
                let flowLayout = UICollectionViewFlowLayout()
                flowLayout.scrollDirection = .horizontal
                let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
                collectionView.backgroundColor = .clear
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                
                return collectionView
            }()
            
            collectionView.delegate = self
            collectionView.dataSource = self
            //cell 등록
            collectionView.register(SectionCellComponent.self, forCellWithReuseIdentifier: "Cell\(index)")
            collectionView.tag = index
            
            // 동적 section 추가
            self.addSubview(sectionHeader)
            self.addSubview(collectionView)
            
            // constraints
            NSLayoutConstraint.activate([
                // sectionHeader
                sectionHeader.topAnchor.constraint(equalTo: previousSection?.bottomAnchor ?? self.topAnchor),
                sectionHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                sectionHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                sectionHeader.heightAnchor.constraint(equalToConstant: 52),
                // section
                collectionView.topAnchor.constraint(equalTo: sectionHeader.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 161)
            ])
            
            previousSection = collectionView
        }
        if let lastCollectionView = previousSection {
            lastCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
}

extension CollectiViewComponent: UICollectionViewDelegate, UICollectionViewDataSource {
    // item 수만큼 출력
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies[collectionView.tag].count 
    }

    // cell 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell\(collectionView.tag)", for: indexPath) as? SectionCellComponent else {
            print("Unable to dequeue CollectionViewCellComponent")
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.black
        if movies.indices.contains(collectionView.tag), movies[collectionView.tag].indices.contains(indexPath.item) {
            let content = movies[collectionView.tag][indexPath.item]
            let imageURL = content.imageURL
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        cell.imageView.image = UIImage(data: imageData)
                    }
                }
            }
        }

        return cell
    }
}

extension CollectiViewComponent: UICollectionViewDelegateFlowLayout {
    // cell layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 103, height: 161)
    }

    // cell spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }

    // cell inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
}
