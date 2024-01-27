//
//  PocketCell.swift
//  ewallet-ios
//
//  Created by hoang phan on 28/01/2024.
//

import UIKit

class PocketCell: UICollectionViewCell, NameDescribable {
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let icon: UILabel = {
        let label = UILabel()
        label.text = "🌴"
        label.backgroundColor = UIColor.lightGray
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.clear.cgColor
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.gray
        label.text = "Travelling"
        return label
    }()
    
    let money: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "$30.000"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(containerView)
        self.containerView.addSubview(icon)
        self.containerView.addSubview(title)
        self.containerView.addSubview(money)
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        icon.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 25).isActive = true
        title.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        title.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 15).isActive = true

        money.translatesAutoresizingMaskIntoConstraints = false
        money.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        money.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        money.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 15).isActive = true
    }
    
    
}
