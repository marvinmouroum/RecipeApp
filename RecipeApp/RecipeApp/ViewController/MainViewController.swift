//
//  ViewController.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import UIKit
import NotificationCenter

class MainViewController: RecipeStandardViewController {

    var table:TableViewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeStaticUI(.plus)
        table.addTable(to: view, with: button.bottomAnchor)
        
        //add an observer for a new recipe creation
        NotificationCenter.default.addObserver(table, selector: #selector(TableViewModel.recipeAdded), name: Notification.Name("NewRecipe"), object: nil)
    
    }
    
    
    @objc override func buttonPressed() {
        let vc = AddRecipeViewController()
        if vc.successfullInit {
            present(vc, animated: true, completion: nil)
        }
    
        
    }
    

}

