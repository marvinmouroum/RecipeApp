//
//  AddRecipeViewController.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import UIKit

class AddRecipeViewController: RecipeStandardViewController {
    
    // MARK: - initializers
    init(){
        
        if let appDel = UIApplication.shared.delegate as? AppDelegate {
            viewModel = AddRecipeViewModel(appDel)
            super.init(nibName: nil, bundle: nil)
            viewModel.viewcontroller = self
            view.backgroundColor = UIColor.systemBackground
        }
        else{
            //if for soe reason the AppDelegate is nil exit from this view controller
            super.init(nibName: nil, bundle: nil)
            successfullInit = false
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - properties
    
    private var viewModel:AddRecipeViewModel!
    
    ///a flag showing if the init was successful in creating the view model
    private(set) var successfullInit:Bool = true
    
    
    //MARK: - ViewController Logic
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeStaticUI(.disk)
        placeSpecificUI()
    }
    
    func placeSpecificUI(){
        let stack1 = placeTitle()
        let stack2 = placeDescription(stack1)
        placeImages(stack2)
    }
    
    func placeTitle() -> UIView{
        let titleStack = viewModel.addTitle(to: self.view, with: self.button.bottomAnchor)
        return titleStack
    }
    
    func placeDescription(_ titleStack:UIView) -> UIView {
        let descriptionStack = viewModel.addDescription(to: self.view, with: titleStack.bottomAnchor)
        return descriptionStack
    }
    
    func placeImages(_ titleStack:UIView){
        _ = viewModel.addImageContainer(to: self.view, with: titleStack.bottomAnchor)
    }
    
    override func buttonPressed() {
        
        guard let alert:UIAlertController = viewModel.saveRecipe() else{
            self.dismiss(animated: true, completion: nil)
            return
        }
        present(alert, animated: true, completion: nil)
        
    }

}
