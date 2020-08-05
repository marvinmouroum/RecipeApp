//
//  RecipeTableViewCell.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    
    override func draw(_ rect: CGRect) {
        let newrect = CGRect(x: 5, y: 5, width: rect.width-10, height: rect.height-10)
        let path = UIBezierPath(roundedRect: newrect, cornerRadius: 10)
        path.lineWidth = 1
        UIColor.label.setStroke()
        path.stroke()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var titleLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var container:ImageContainer = {
        let container = ImageContainer(images:[])
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var contentLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .label
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    func setup(){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        self.addSubview(container)
        container.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        contentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        
    }

}
