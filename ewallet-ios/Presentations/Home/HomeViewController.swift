//
//  HomeViewController.swift
//  ewallet-ios
//
//  Created by hoang phan on 27/01/2024.
//

import UIKit

class HomeViewController : BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var pockets: [PocketModel] = PocketModel.CreatePocketData()
    private let leftBar: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.spacing = 8
        
        let button = UIButton()
        let buttonWidthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 33)
        let buttonHeightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 33)
        button.addConstraints([buttonWidthConstraint, buttonHeightConstraint])
        button.setTitle("👱‍♂️", for: .normal)
        button.layer.cornerRadius = 33/2
        button.layer.borderWidth = 1
        button.layer.borderColor =  UIColor(hex: "#e8eaed").cgColor
        button.backgroundColor = UIColor(hex: "#e8eaed")
        
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.spacing = 0
        
        let title = UILabel()
        title.text = "Good Morning!"
        title.textColor = UIColor(hex: "#b4abaa")
        title.font = UIFont.systemFont(ofSize: 12)
        
        let name = UILabel()
        name.text = "Phan Quang Hoàng"
        name.textColor = UIColor.black
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        subStack.insertArrangedSubview(title, at: 0)
        subStack.insertArrangedSubview(name, at: 1)
        stack.insertArrangedSubview(button, at: 0)
        stack.insertArrangedSubview(subStack, at: 1)
        
        return stack
    }()
    
    private let rightBar: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        
        let button = UIButton()
        button.tintColor = UIColor(hex: "#282444")
        button.setImage(UIImage(named: "ic-notification.png")?.withRenderingMode(.alwaysTemplate), for: .normal)
        let buttonWidthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        let buttonHeightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        button.addConstraints([buttonWidthConstraint, buttonHeightConstraint])
       
        stack.addArrangedSubview(button)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBar)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBar)
        let button: UIButton = rightBar.arrangedSubviews[0] as! UIButton
        button.addTarget(self, action: #selector(notiButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CarouselCardCell.self,
                               forCellWithReuseIdentifier: CarouselCardCell.typeName)
        collectionView.register(HomeMenuCell.self,
                                forCellWithReuseIdentifier: HomeMenuCell.typeName)
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
    
    @objc private func notiButtonPressed(_ sender: UIButton) {
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 0) {
            return 2
        }
        
        return pockets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCardCell.typeName, for: indexPath)
                return cell
            }
            
            if (indexPath.row == 1) {
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCell.typeName, for: indexPath)
                return cell
            }
        }
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: PocketCell.typeName, for: indexPath) as! PocketCell
        cell.setData(pocket: pockets[indexPath.row])
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
