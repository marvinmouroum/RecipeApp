//
//  ImageContainer.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import Foundation
import UIKit

class ImageContainer:UIScrollView {
    
    var images:[RecipeImages]
    
    init(images:[RecipeImages]){
        self.images = images
        super.init(frame: CGRect())
        addViews()
        //contentSize.width = 5000
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var stackView:UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 10
        
        return view
    }()
    
    var addButton:AddButton = {
        let button = AddButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.showsTouchWhenHighlighted = true
        button.tintColor = UIColor.lightGray
        return button
    }()
    
    private func addViews(){
        
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        stackView.heightAnchor.constraint(equalTo:self.heightAnchor).isActive = true
        
    }
    
    func insertButton(){
        stackView.insertArrangedSubview(self.addButton, at: 0)
        self.addButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func fill(_ target:Any, selector:Selector){
        
        //clear the stackview
        for view in stackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        //insert the button
        insertButton()
        
        //insert the images
        for img in images{
            let recipeImage = RecipeImage(recipeImages: img)
            stackView.addArrangedSubview(recipeImage)
            recipeImage.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            recipeImage.switchMode(large: false)
            recipeImage.deleteButton.addTarget(target, action: selector, for: .touchUpInside)
            
        }
    }
    
    func fill(){
        
        //clear the stackview
        for view in stackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        //insert the images
        for img in images{
            let recipeImage = RecipeImage(recipeImages: img)
            stackView.addArrangedSubview(recipeImage)
            recipeImage.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            recipeImage.switchMode(large: true)
            
        }
    }
    
    
}
