//
//  RecipeImage.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import Foundation
import UIKit

class RecipeImage:UIView {
    
    private var image:UIImage {
        didSet {
            self.imageView.image = self.image
        }
    }
    
    var coreModel:RecipeImages
    
    var imageView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var deleteButton:CrossButton = {
        let button = CrossButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(recipeImages:RecipeImages){
        self.image = UIImage(data: (recipeImages.data ?? Data())) ?? UIImage(named: "brokenImage")!
        self.coreModel = recipeImages
        super.init(frame: CGRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        placeImage()
        placeButton()
        self.imageView.image = self.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(data:Data){
        self.image = UIImage(data: data) ?? UIImage(named: "brokenImage")!
    }
    
    var widthLarge:NSLayoutConstraint?
    var widthSmall:NSLayoutConstraint?
    
    private var p:CGFloat = 0.75
    
    
    private func placeImage(){
        self.addSubview(self.imageView)
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        widthLarge = imageView.widthAnchor.constraint(equalTo: self.widthAnchor)
        widthSmall = imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: p)
        
        widthSmall?.isActive = false
        widthLarge?.isActive = true
        
    }
    
    private func placeButton(){
        self.addSubview(self.deleteButton)
        deleteButton.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        deleteButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: self.imageView.topAnchor).isActive = true
        
    }
    
    func switchMode(large:Bool){
        if large {
            widthSmall?.isActive = false
            widthLarge?.isActive = true
        }
        else{
            widthLarge?.isActive = false
            widthSmall?.isActive = true
        }
        
        self.setNeedsDisplay()
        self.layoutIfNeeded()
    }
    
    
    
}
