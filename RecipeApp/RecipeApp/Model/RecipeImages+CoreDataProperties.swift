//
//  RecipeImages+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//
//

import Foundation
import CoreData


extension RecipeImages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeImages> {
        return NSFetchRequest<RecipeImages>(entityName: "RecipeImages")
    }

    @NSManaged public var data: Data?
    @NSManaged public var test: String?
    @NSManaged public var recipeRelation: Recipe?

}
