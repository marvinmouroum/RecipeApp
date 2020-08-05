//
//  RecipeStandardViewController.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import UIKit

class RecipeStandardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private(set) var label = UILabel()
    private(set) var button = UIButton()
    
    enum ButtonType {
        case plus
        case disk
    }
    
    func placeStaticUI(_ buttonType: ButtonType){
        placeLabel(type: buttonType)
        placeButton(type: buttonType)
    }
    
    public func placeLabel(type: ButtonType) {
        
        label = TitleLabel(type)
        
        //deletes old layout constraints
        label.removeFromSuperview()
        
        //create new layout constraints
        self.view.addSubview(label)
        (label as! TitleLabel).layout(self.view)
        
        
    }
    
    public func placeButton(type:ButtonType) {
        
        switch type {
        case .plus:
            button = UIButton(type: .contactAdd)
            button.tintColor = UIColor.label
            break
        case .disk:
            button = UIButton()
            button.setImage(UIImage(named: "disk"), for: .normal)
            
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        //deletes old layout constraints
        button.removeFromSuperview()
        
        //layout the button
        self.view.addSubview(button)
        button.layoutStandardButton(self.view)
        
    }
    
    @objc func buttonPressed(_ sender:Any?){
        print("button pressed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
