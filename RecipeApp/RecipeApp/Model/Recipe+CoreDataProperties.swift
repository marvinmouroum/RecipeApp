//
//  Recipe+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var title: String?
    @NSManaged public var contentRelation: NSOrderedSet?
    @NSManaged public var imageRelation: NSOrderedSet?

}

// MARK: Generated accessors for contentRelation
extension Recipe {

    @objc(insertObject:inContentRelationAtIndex:)
    @NSManaged public func insertIntoContentRelation(_ value: RecipeContent, at idx: Int)

    @objc(removeObjectFromContentRelationAtIndex:)
    @NSManaged public func removeFromContentRelation(at idx: Int)

    @objc(insertContentRelation:atIndexes:)
    @NSManaged public func insertIntoContentRelation(_ values: [RecipeContent], at indexes: NSIndexSet)

    @objc(removeContentRelationAtIndexes:)
    @NSManaged public func removeFromContentRelation(at indexes: NSIndexSet)

    @objc(replaceObjectInContentRelationAtIndex:withObject:)
    @NSManaged public func replaceContentRelation(at idx: Int, with value: RecipeContent)

    @objc(replaceContentRelationAtIndexes:withContentRelation:)
    @NSManaged public func replaceContentRelation(at indexes: NSIndexSet, with values: [RecipeContent])

    @objc(addContentRelationObject:)
    @NSManaged public func addToContentRelation(_ value: RecipeContent)

    @objc(removeContentRelationObject:)
    @NSManaged public func removeFromContentRelation(_ value: RecipeContent)

    @objc(addContentRelation:)
    @NSManaged public func addToContentRelation(_ values: NSOrderedSet)

    @objc(removeContentRelation:)
    @NSManaged public func removeFromContentRelation(_ values: NSOrderedSet)

}

// MARK: Generated accessors for imageRelation
extension Recipe {

    @objc(insertObject:inImageRelationAtIndex:)
    @NSManaged public func insertIntoImageRelation(_ value: RecipeImages, at idx: Int)

    @objc(removeObjectFromImageRelationAtIndex:)
    @NSManaged public func removeFromImageRelation(at idx: Int)

    @objc(insertImageRelation:atIndexes:)
    @NSManaged public func insertIntoImageRelation(_ values: [RecipeImages], at indexes: NSIndexSet)

    @objc(removeImageRelationAtIndexes:)
    @NSManaged public func removeFromImageRelation(at indexes: NSIndexSet)

    @objc(replaceObjectInImageRelationAtIndex:withObject:)
    @NSManaged public func replaceImageRelation(at idx: Int, with value: RecipeImages)

    @objc(replaceImageRelationAtIndexes:withImageRelation:)
    @NSManaged public func replaceImageRelation(at indexes: NSIndexSet, with values: [RecipeImages])

    @objc(addImageRelationObject:)
    @NSManaged public func addToImageRelation(_ value: RecipeImages)

    @objc(removeImageRelationObject:)
    @NSManaged public func removeFromImageRelation(_ value: RecipeImages)

    @objc(addImageRelation:)
    @NSManaged public func addToImageRelation(_ values: NSOrderedSet)

    @objc(removeImageRelation:)
    @NSManaged public func removeFromImageRelation(_ values: NSOrderedSet)

}
