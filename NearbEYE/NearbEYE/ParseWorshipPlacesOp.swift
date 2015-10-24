//
//  ParseWorshipPlacesOp.swift
//  NearbEYE
//
//  Created by Stephen Melinyshyn on 2015-10-24.
//  Copyright © 2015 Stephen Melinyshyn. All rights reserved.
//

import UIKit
import CoreData

class ParseWorshipPlacesOp: Operation {

	var loadJSONOp : LoadJSONOperation!
	init(loadJSONOp : LoadJSONOperation!) {
		self.loadJSONOp = loadJSONOp
		super.init()
	}
	
	override func execute() {
		guard let features = loadJSONOp.json["features"] as? [[String : AnyObject]] else {
			fatalError("JSON loaded from LoadJSONOperation is different than what was expected.")
		}
		context!.performBlockAndWait({ () -> Void in
			
			
			for rink in features {
				
				guard let properties =  rink["properties"] as? [String : AnyObject]  else {
					fatalError("No properties in json")
				}
				
				guard let name = properties["NAME"] as? String else {
					fatalError("Could not extract PARK_NAME from JSON.")
				}
				
				guard let addr = properties["ADDRESS"] as? String else {
					fatalError("Could not extract desc from JSON")
				}
				
				guard let geometry = rink["geometry"] as? [String : AnyObject] else {
					fatalError("No geometry, talk to stephen.")
				}
				
				guard let coordinates = geometry["coordinates"] as? [Double] else {
					fatalError("No coords, talk to stephen.")
				}
				
				let p = NSEntityDescription.insertNewObjectForEntityForName("PlaceOfWorship", inManagedObjectContext: self.context!) as! PlaceOfWorship
				p.longitude = coordinates[0]
				p.latitude = coordinates[1]
				p.name = name
				p.address = addr
				print("Added worship")

			}
		})
		finish()
	}
	

	
}
