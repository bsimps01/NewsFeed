//
//  LayoutView.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/8/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import UIKit

class LayoutView: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        self.sectionInset = UIEdgeInsets(top: 10, left: 3, bottom: 15, right: 3)
        self.sectionInsetReference = .fromSafeArea
        let setWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minColumnWidth = CGFloat(135)
        let maxNumColumns = Int(setWidth/minColumnWidth)
        let cellWidth = (setWidth / CGFloat(maxNumColumns)).rounded(.down)
        self.itemSize = CGSize(width: cellWidth, height: 200)
    }
    
}
