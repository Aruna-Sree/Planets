//
//  DataHelper.swift
//  Planet
//
//  Created by Aruna Yarra on 04/01/19.
//  Copyright © 2019 Aruna Yarra. All rights reserved.
//

import UIKit
import CoreData

public class DataHelper: NSObject {
 
    public func addPlanetsDataToDB(array: [[String: AnyObject]]) {
        _ = array.map{self.createPlanetEntityFrom(dictionary: $0)}
        PlanetModule.sharedInstance.saveContext()
    }
    
    //Saving only name as per requirement instead of whole data coming from API request
    private func createPlanetEntityFrom(dictionary: [String: AnyObject]) {
        if dictionary["name"] != nil {
            PlanetModule.sharedInstance.addEntity(entityName: "Planet", dictionary: ["name":dictionary["name"] as! String], key: "name", value: dictionary["name"] as? String)
        }
    }
}
