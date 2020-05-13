//
//  ArticlesCell.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/12/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlesCell: UITableViewCell {
    
    @IBOutlet var headLineLabel: UILabel!
    
    var article: Article? = nil {
        didSet {
            //getImage(article: article!)
            headLineLabel.text = article?.title
            headLineLabel.textColor = .black
            
        }
    }
    
    @IBOutlet var articleImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    
    
    func getImage(article: Article) {
        if let imageURL = article.urlToImage {
            articleImageView.kf.setImage(with: URL(string: imageURL)) { result in
                switch result {
                case .success(let value):
                    self.trailingAnchor.constraint(equalTo: self.articleImageView.trailingAnchor).isActive = true
                    print(value.image)
                case .failure(let error):
                    self.trailingAnchor.constraint(equalTo: self.articleImageView.trailingAnchor).isActive = true
                    print(error)
                }
            }
        }
    }
    
}
