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
        label.backgroundColor = UIColor(hex: "#e8eaee")
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.clear.cgColor
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(hex: "#939db3")
        return label
    }()
    
    let money: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    let more: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic-more.png")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = UIColor.lightGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(containerView)
        self.containerView.addSubview(icon)
        self.containerView.addSubview(title)
        self.containerView.addSubview(money)
        self.containerView.addSubview(more)
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
        
        more.translatesAutoresizingMaskIntoConstraints = false
        more.centerYAnchor.constraint(equalTo: icon.centerYAnchor).isActive = true
        more.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15).isActive = true
        more.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 25).isActive = true
        title.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        title.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 15).isActive = true

        money.translatesAutoresizingMaskIntoConstraints = false
        money.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        money.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        money.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 15).isActive = true
    }
    
    func setData(pocket: PocketModel) {
        icon.text = pocket.title
        title.text = pocket.name
        money.text = pocket.money
    }
}
