//
//  ViewController.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 28/09/2022.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var event: UILabel!
    
    var name: String = "Twój event"
    
    var year: String = "0000"
    var month: String = "00"
    var day: String = "00"
    var selectDate: String = ""
    
    var actualYear: String = ""
    var actualMonth: String = ""
    var actualDay: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        event.text = "\(name)!"
        label.text = "\(year):\(month):\(day)"
        
        
    }
    
    @IBAction func unwindToOne(_ sender: UIStoryboardSegue) {
        var days = createCount(Y: year, M: month, D: day)
        print("A")
    }
    
    func createCount(Y: String, M: String, D: String) -> Int {
        
        let present = Date()
        let pastDate = "M/D/Y"
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MM/dd/yyyy"
        let pastDateDate = formatter1.date(from: pastDate)
        
        // Count seconds and days between dates
        let seconds = pastDateDate?.distance(to: present)
        let days = (seconds! / 86400)
        
        let time = Int(days.rounded())
        return time
    }
    
   
}


//MARK: - Calendar
//extension Calendar {
//    func numberOfDaysBetween(_ from: Date, to: Date) -> Int {
//        let fromDate = startOfDay(for: from) // <1>
//        let toDate = startOfDay(for: to) // <2>
//        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
//
//        return numberOfDays.day!
//        print(numberOfDays.day!)
//    }
//}
//
//
//
//
////MARK: - use calendar
//
//class AddNewViewController: UIViewController {
//    var number: Calendar!
//
//
//    var selectDate: Date = Date()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        var dayOne = self.number.numberOfDaysBetween(selectDate, to: Date())
//
//        label.text = "\(day)"
//
//    }
//
//
//}
