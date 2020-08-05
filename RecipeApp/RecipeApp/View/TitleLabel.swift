//
//  TitleLabel.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {

    init(_ type: RecipeStandardViewController.ButtonType){
        super.init(frame: CGRect())
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.label
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 20)
        
        switch type {
        case .plus:
                    self.text = "All Recipes"
            break
        case .disk:
                    self.text = "Add Recipe"
            
        }
    }
    
    func layout(_ view:UIView){
        self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
