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
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
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
        
        //create new layout constraints
        self.view.addSubview(button)
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        
    }
    
    @objc func buttonPressed(_ sender:Any?){
        print("button pressed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
