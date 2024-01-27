//
//  HomeViewController.swift
//  ewallet-ios
//
//  Created by hoang phan on 27/01/2024.
//

import UIKit

class HomeViewController : BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.tabBarController?.tabBar.isTranslucent = false;
        
        let notiIcon = UIImage(named: "ic-notification.png")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: notiIcon, style: .plain, target: self, action: nil)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CarouselCardCell.self,
                               forCellWithReuseIdentifier: CarouselCardCell.typeName)
        collectionView.register(FunctionViewCell.self,
                                forCellWithReuseIdentifier: FunctionViewCell.typeName)
        collectionView.register(PocketCell.self,
                                forCellWithReuseIdentifier: PocketCell.typeName)
        collectionView.register(PocketSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PocketSectionHeader.typeName)
        setupCollectionConstraints()
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 0) {
            return 2
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCardCell.typeName, for: indexPath)
                return cell
            }
            
            if (indexPath.row == 1) {
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: FunctionViewCell.typeName, for: indexPath)
                return cell
            }
        }
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: PocketCell.typeName, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PocketSectionHeader.typeName, for: indexPath) as! PocketSectionHeader
             return sectionHeader
        } else { //No footer in this case but can add option for that
             return UICollectionReusableView()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                return CGSize(width: collectionView.bounds.width, height: 200)
            }
              
            if (indexPath.row == 1) {
                return CGSize(width: collectionView.bounds.width, height: 120)
            }
        }
        
        return CGSize(width: collectionView.bounds.width/2 - 20, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (section == 1) {
            return UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        }
        return UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 0) {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}
