//
//  TableViewModel.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/**
 The view model acts as data source for the main view with UITableView
 - It reacts to user intent by implementing the UITableViewDelegate
 - It acts as the tables data source implementing UITableViewDataSource
 The data source is the recipe object array that is directly loaded from the persitent storage, therefor the class needs to constructor to implement the dependency injection
 */
class TableViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Code concerning the UI
    
    // creates the tableview in a lazy var to simplify the initializer
    // private set to ensure the property can only be read
    lazy private(set) var tableView:UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource         = self
        view.delegate           = self
        view.separatorStyle     = .none
        return view
    }()

    
    //add the table to a view
    func addTable(to view: UIView, with topAnchor:NSLayoutYAxisAnchor, and constant:CGFloat = 15){
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: "RecipeCell")
        
        reloadData()
        
    }
    
    // MARK: - Code concerning the model
    
    ///the recipes to showcase
    private var recipes:[Recipe] = []
    
    ///loading data from Core and update the tableview
    ///can be used in parallel processing, is thread save
    private func reloadData(_ appDelegate:AppDelegate? = nil){
        
        if appDelegate == nil {
            if let appDel:AppDelegate = UIApplication.shared.delegate as? AppDelegate  {
                self.recipes = CoreAPI.getAllRecipes(appDelegate: appDel)
            }
        }
        else{
            self.recipes = CoreAPI.getAllRecipes(appDelegate: appDelegate!)
        }
        
        if Thread.isMainThread {
            self.tableView.reloadData()
        }
        else{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    ///observer method for new recipe created notifications
    @objc func recipeAdded(_ sender:AddRecipeViewModel){
        print("recipe added")
        self.reloadData()
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell")!
        (cell as! RecipeTableViewCell).setup()
        
        //set the title in the cell
        (cell as! RecipeTableViewCell).titleLabel.text = getTitle(index: indexPath.row)
        
        //set the content in a list form, increment the number of lines for every entry
        let content = getContent(index: indexPath.row)
        (cell as! RecipeTableViewCell).contentLabel.text = content.0
        (cell as! RecipeTableViewCell).contentLabel.numberOfLines = content.1
       
        //set the images in the scrollview container (stackview) from the persistent storage
        (cell as! RecipeTableViewCell).container.images = recipes[indexPath.row].imageRelation?.array as? [RecipeImages] ?? []
        (cell as! RecipeTableViewCell).container.fill()
        
        //return the cell to be shown in the table view
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //every cell/recipe can be deleted
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if let appDel = UIApplication.shared.delegate as? AppDelegate {
                CoreAPI.delete(appDel, self.recipes[indexPath.row])
                do{
                    try CoreAPI.save(appDel)
                }catch CoreDataError.SavingError {
                    print("Saving error")
                }catch{
                    print("unknown error")
                }
                
                reloadData()
            }
            
        }
    }
    
    // MARK: - Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //increase the height of the - by the number of list elements present for the recipe
        return 325 + CGFloat((recipes[indexPath.row].contentRelation ?? []).count*25)
    }
    
    
    
    // MARK: - Setting Up the cell
    
    /**
    *get the title of the recipe at index*
    - Parameters:
       - parameter index: position of the content object in the recipe list to access
    - Returns: title as string
    */
    func getTitle(index:Int)->String {
        return recipes[index].title ?? "Titel"
    }
    
    /**
     *get the content of the recipe at index*
     - Parameters:
        - parameter index: position of the content object in the recipe list to access
     - Returns: tuple of string value for displaying in the label and the number of lines required for the label
     */
    func getContent(index:Int)->(String,Int) {
        
        var string = ""
        var lines = 1
        for item in recipes[index].contentRelation ?? [] {
            if let content = (item as! RecipeContent).data{
                string += " - " + content + "\n"
                lines += 1
            }
            
        }
        
        return (string,lines)
    }

    
    
    
}
