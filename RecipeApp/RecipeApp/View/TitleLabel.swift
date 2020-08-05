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
        
        switch type {
        case .plus:
                    self.text = "All Recipes"
            break
        case .disk:
                    self.text = "Add Recipe"
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
