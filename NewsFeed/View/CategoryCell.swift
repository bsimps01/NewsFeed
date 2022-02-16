//
//  CategoryCollectionViewCell.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/8/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {
    
    static var identifier: String = "CategoryCell"

    @IBOutlet weak var categoryLabel: UILabel!
    
    var category: Article? = nil {
        didSet {
            categoryLabel.textColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        // Initialization code
    }
    public func setUp(with model: NewsSource) {
        categoryLabel.text = model.category
        categoryLabel.text = model.name
    }

}
