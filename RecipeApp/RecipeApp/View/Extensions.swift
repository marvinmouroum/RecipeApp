//
//  Extensions.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 05.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func layoutStandardButton(_ view:UIView){
        self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
