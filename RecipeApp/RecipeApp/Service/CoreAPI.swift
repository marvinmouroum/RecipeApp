//
//  CoreAPI.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataError: Error {
    case NoApplicationDelegate
    case SavingError
}

struct CoreAPI {
    
    static func getAllRecipes(appDelegate:AppDelegate) -> [Recipe] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        
        do {
            let context = appDelegate.persistentContainer.viewContext
            let result = try context.fetch(fetchRequest)
            
            return result as! [Recipe]
        } catch {
            print("Fetching data Failed")
            return []
        }
    }
    
    static func createEmptyRecipe(appDelegate:AppDelegate) -> Recipe {
        let context = appDelegate.persistentContainer.viewContext
         let recipe = Recipe(entity: NSEntityDescription.entity(forEntityName: "Recipe", in: context)!, insertInto: context)
        return recipe
    }
    
    static func createRecipeContent(_ appDelegate:AppDelegate, _ text:String) -> RecipeContent {
        let context = appDelegate.persistentContainer.viewContext
        let content = RecipeContent(entity: NSEntityDescription.entity(forEntityName: "RecipeContent", in: context)!, insertInto: context)
        content.data = text
        return content
    }
    
    static func createRecipeImage(_ appDelegate:AppDelegate, _ data:Data? = nil) -> RecipeImages {
        let context = appDelegate.persistentContainer.viewContext
        let content = RecipeImages(entity: NSEntityDescription.entity(forEntityName: "RecipeImages", in: context)!, insertInto: context)
        if let data = data{
            content.data = data
        }
       
        return content
    }
    
    static func save(_ appDelegate:AppDelegate) throws {
        let context = appDelegate.persistentContainer.viewContext
        do {
            try context.save()
        }
        catch{
            throw CoreDataError.SavingError
        }
    }
    
    static func delete(_ appDelegate:AppDelegate, _ object:NSManagedObject) {
        let context = appDelegate.persistentContainer.viewContext
        context.delete(object)
    }
    
}
