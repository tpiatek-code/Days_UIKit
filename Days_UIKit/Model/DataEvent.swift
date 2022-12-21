//
//  DataEvent.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 26/10/2022.
//

import UIKit

class DataEvent: NSObject, NSCoding {
    
    var name: String
    var day: String
    
    var yearS: String
    var monthS: String
    var dayS: String
    
    init(name: String, day: String, yearS: String, monthS: String, dayS: String) {
        self.name = name
        self.day = day
        
        self.yearS = yearS
        self.monthS = monthS
        self.dayS = dayS
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "iName") as? String ?? ""
        day = aDecoder.decodeObject(forKey: "iDay") as? String ?? ""
        
        yearS = aDecoder.decodeObject(forKey: "yearS") as? String ?? ""
        monthS = aDecoder.decodeObject(forKey: "monthS") as? String ?? ""
        dayS = aDecoder.decodeObject(forKey: "dayS") as? String ?? ""
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "iName")
        coder.encode(day, forKey: "iDay")
        
        coder.encode(yearS, forKey: "yearS")
        coder.encode(monthS, forKey: "monthS")
        coder.encode(dayS, forKey: "dayS")
    }
    
}
