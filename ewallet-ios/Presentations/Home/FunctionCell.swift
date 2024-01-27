//
//  FunctionCell.swift
//  ewallet-ios
//
//  Created by hoang phan on 27/01/2024.
//

import UIKit

struct FunctionInfo {
    let name: String
    let icon: String
}

class FunctionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NameDescribable {
    
    let funcInfos: [FunctionInfo] = [
        FunctionInfo(name: "Transfer", icon: "ic-transfer.png"),
        FunctionInfo(name: "Scan", icon: "ic-scan.png"),
        FunctionInfo(name: "Top-up", icon: "ic-topup.png"),
        FunctionInfo(name: "More", icon: "ic-more.png")
    ]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(FunctionCell.self,
                                forCellWithReuseIdentifier: FunctionCell.typeName)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(collectionView)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.setupCollectionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return funcInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FunctionCell.typeName, for: indexPath) as! FunctionCell
        cell.setTitle(info: funcInfos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 90)
    }
}

class FunctionCell: UICollectionViewCell, NameDescribable {
    
    let content: FunctionView = {
        let view = FunctionView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(content)
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        content.translatesAutoresizingMaskIntoConstraints = false
        content.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        content.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    func setTitle(info: FunctionInfo) {
        self.content.setTitle(info: info)
    }
}

class FunctionView: UIView {
    
    enum FunctionType {
        case transfer
        case scan
        case topup
        case more
    }
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.backgroundColor = UIColor(hex: "#011132")
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#011132").cgColor
        return view;
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Transfer"
        label.textColor = UIColor(hex: "#011132")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(title)
        self.setupConstraints()
    }
    
    convenience init(frame: CGRect, with functionType: FunctionType) {
        self.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func setTitle(info: FunctionInfo) {
        self.title.text = info.name
        self.imageView.image = UIImage(named: info.icon)
    }
}
