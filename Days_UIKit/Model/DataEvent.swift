//
//  DataEvent.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 26/10/2022.
//

import UIKit

class DataEvent: NSObject, NSCoding {
    
    var iName: String
    var iDay: String
    
    init(iName: String, iDay: String) {
        self.iName = iName
        self.iDay = iDay
    }
    
    required init?(coder aDecoder: NSCoder) {
        iName = aDecoder.decodeObject(forKey: "iName") as? String ?? ""
        iDay = aDecoder.decodeObject(forKey: "iDay") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(iName, forKey: "iName")
        coder.encode(iDay, forKey: "iDay")
    }
    
}
