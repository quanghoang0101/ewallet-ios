//
//  CardCell.swift
//  ewallet-ios
//
//  Created by hoang phan on 27/01/2024.
//

import UIKit
import CreditCardView

class CardCell: UICollectionViewCell, NameDescribable {
    
    let cardView: CreditCardView?
    
    override init(frame: CGRect) {
        cardView = CreditCardView(frame: frame, template: .Gradient(UIColor(rgb: 0x6F73D2), UIColor(rgb: 0x2FB799)))
        super.init(frame: frame)
        self.contentView.addSubview(cardView!)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        cardView = CreditCardView()
        
        super.init(coder: coder)
    }
    
    func setupConstraints() {
        self.cardView?.translatesAutoresizingMaskIntoConstraints = false
        self.cardView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.cardView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.cardView?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        self.cardView?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setDataDisplays(info: CardInfo) {
        cardView?.nameLabel.text = info.name
        cardView?.expLabel.text = info.exp
        cardView?.numLabel.text = info.number
        cardView?.brandLabel.text = info.brand
        cardView?.brandImageView.image = UIImage()
    }
    
}
