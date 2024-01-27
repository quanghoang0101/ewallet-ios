//
//  CardCell.swift
//  ewallet-ios
//
//  Created by hoang phan on 27/01/2024.
//

import UIKit

class CarouselCardCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, NameDescribable {
    
    var collectionView: UICollectionView?
    var dataSources: [CardInfo] = []
    
    fileprivate var currentPage: Int = 0
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView?.collectionViewLayout as! CarouselFlowLayout
        var pageSize = layout.itemSize
        pageSize.width += layout.minimumLineSpacing
        return pageSize
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCollectionView()
        self.setupLayout()
        self.dataSources = CardInfo.CreateDataSource()
    }
    
    func setupCollectionConstraints() {
        self.collectionView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.collectionView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.collectionView?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        self.collectionView?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setupLayout() {
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView?.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        collectionView?.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        self.currentPage = 0
    }

    func addCollectionView() {

        // This is just an utility custom class to calculate screen points
        // to the screen based in a reference view. You can ignore this and write the points manually where is required.
        let pointEstimator = RelativeLayoutUtilityClass(referenceFrameSize: self.contentView.frame.size)

        // This is where the magic is done. With the flow layout the views are set to make costum movements. See https://github.com/ink-spot/UPCarouselFlowLayout for more info
        let layout = CarouselFlowLayout()
        // This is used for setting the cell size (size of each view in this case)
        // Here I'm writting 400 points of height and the 73.33% of the height view frame in points.
        layout.itemSize = CGSize(width: pointEstimator.relativeWidth(multiplier: 0.85), height: 190)
        // Setting the scroll direction
        layout.scrollDirection = .horizontal

        // Collection view initialization, the collectionView must be
        // initialized with a layout object.
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // This line if for able programmatic constrains.
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        // CollectionView delegates and dataSource:
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        // Scroll indicator
        self.collectionView?.showsHorizontalScrollIndicator = false
        // Registering the class for the collection view cells
        self.collectionView?.register(CardCell.self, forCellWithReuseIdentifier: CardCell.typeName)

        // Spacing between cells:
        let spacingLayout = self.collectionView?.collectionViewLayout as! CarouselFlowLayout
        spacingLayout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 10)

        self.contentView.addSubview(self.collectionView!)

    }

    // MARK: - Card Collection Delegate & DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSources.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.typeName, for: indexPath) as! CardCell
        cell.setDataDisplays(info: dataSources[indexPath.item])
        return cell
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView?.collectionViewLayout as! CarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
}

class RelativeLayoutUtilityClass {

    var heightFrame: CGFloat?
    var widthFrame: CGFloat?

    init(referenceFrameSize: CGSize){
        heightFrame = referenceFrameSize.height
        widthFrame = referenceFrameSize.width
    }

    func relativeHeight(multiplier: CGFloat) -> CGFloat{
        return multiplier * self.heightFrame!
    }

    func relativeWidth(multiplier: CGFloat) -> CGFloat{
        return multiplier * self.widthFrame!

    }
}
