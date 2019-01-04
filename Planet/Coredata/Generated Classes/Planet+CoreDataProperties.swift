//
//  Planet+CoreDataProperties.swift
//  Planet
//
//  Created by Aruna Yarra on 04/01/19.
//  Copyright © 2019 Aruna Yarra. All rights reserved.
//
//

import Foundation
import CoreData


extension Planet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planet> {
        return NSFetchRequest<Planet>(entityName: "Planet")
    }

    @NSManaged public var name: String?

}
