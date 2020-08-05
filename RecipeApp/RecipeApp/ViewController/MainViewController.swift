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
        NotificationCenter.default.addObserver(self, selector: #selector(buttonPressed), name: Notification.Name("Edit"), object: nil)
    
    }
    
    
    @objc override func buttonPressed(_ sender:Any?) {
       
        self.table.deselect()
        
        let model = sender as? NSNotification
        let viewmodel = model?.object as? TableViewModel
        
        let vc = AddRecipeViewController(viewmodel?.recipe)
        if vc.successfullInit {
            present(vc, animated: true, completion: nil)
        }
    }
    

}

