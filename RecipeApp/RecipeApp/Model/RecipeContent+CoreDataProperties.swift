//
//  RecipeContent+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//
//

import Foundation
import CoreData


extension RecipeContent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeContent> {
        return NSFetchRequest<RecipeContent>(entityName: "RecipeContent")
    }

    @NSManaged public var data: String?
    @NSManaged public var recipeRelation: Recipe?

}
