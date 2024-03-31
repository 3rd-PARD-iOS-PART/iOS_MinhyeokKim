//
//  SectionComponent.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/30.
//

import UIKit

class CollectiViewComponent: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
        let numberOfCollectionViews = ContentModel.ContentModelData.count
            var previousSection: UICollectionView?
            
            for index in 0..<numberOfCollectionViews {
                let sectionHeader = SectionHeaderComponent()
                sectionHeader.translatesAutoresizingMaskIntoConstraints = false
                let category = ContentModel.ContentModelData[index].first?.category ?? ""
                sectionHeader.category.text = category
                
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
                collectionView.register(SectionCellComponent.self, forCellWithReuseIdentifier: "Cell\(index)")
                collectionView.tag = index
                
                self.addSubview(sectionHeader)
                self.addSubview(collectionView)
                
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ContentModel.ContentModelData[collectionView.tag].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell\(collectionView.tag)", for: indexPath) as? SectionCellComponent else {
            print("Unable to dequeue CollectionViewCellComponent")
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.black
        let content = ContentModel.ContentModelData[collectionView.tag][indexPath.item]
        if let image = UIImage(named: "\(content.image).jpeg") {
            cell.imageView.image = image
        } else {
            // Handle the case when image is not found
            print("Image \(content.image) not found!")
        }

        return cell
    }
}

extension CollectiViewComponent: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 103
        let cellHeight: CGFloat =  161
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
}
