//
//  ArticlesCell.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/9/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlesCell: UICollectionViewCell {
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(imageView)
        setUpImage()
    }
         
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     func setUpImage() {
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
         imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
         imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
         imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
     }
     
     func getImage(article: Article) {
         if let imageURL = article.urlToImage {
            imageView.kf.setImage(with: URL(string: imageURL)) { result in
                 switch result {
                 case .success(let value):
                     self.trailingAnchor.constraint(equalTo: self.imageView.leadingAnchor).isActive = true
                     print(value.image)
                     print(value.cacheType)
                     print(value.source)
                 case .failure(let error):
                     self.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
                     print(error)
                 }
             }
         }
     }

}
