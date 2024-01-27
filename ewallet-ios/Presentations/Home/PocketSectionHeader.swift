//
//  PocketSectionHeader.swift
//  ewallet-ios
//
//  Created by hoang phan on 28/01/2024.
//

import UIKit

class PocketSectionHeader: UICollectionReusableView, NameDescribable {
    var label: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = "My Pocket"
        label.sizeToFit()
        return label
     }()

     override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
