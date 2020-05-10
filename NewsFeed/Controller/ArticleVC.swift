//
//  ArticleVC.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/9/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import UIKit

class ArticleVC: UITableViewCell {

     let background : UIView = {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            return background
        }()
        
        static var identifier = "ArticleCell"
    
        var currentArticle : Article!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
        }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setup()
            
        }
        
        func setup() {
            self.contentView.addSubview(background)
            background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
            background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
            background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
            background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
            
        }
        func createImage(item: Article) {
            textLabel?.text = item.title
            
            imageView?.image = UIImage(named: item.urlToImage!)
            imageView?.translatesAutoresizingMaskIntoConstraints = false
            imageView?.heightAnchor.constraint(equalToConstant: 60).isActive = true
            imageView?.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
            
            textLabel?.translatesAutoresizingMaskIntoConstraints = false
            textLabel?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
            textLabel?.leadingAnchor.constraint(equalTo: imageView!.trailingAnchor, constant: 25).isActive = true
            
        }

        func setContents(article: Article) {
            
            textLabel?.text = article.description
            imageView?.image = UIImage(named: article.urlToImage!)
            imageView?.translatesAutoresizingMaskIntoConstraints = false
            imageView?.heightAnchor.constraint(equalToConstant: 60).isActive = true
            imageView?.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
            
            textLabel?.translatesAutoresizingMaskIntoConstraints = false
            textLabel?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
            textLabel?.leadingAnchor.constraint(equalTo: imageView!.trailingAnchor, constant: 25).isActive = true
        }
        
    }



