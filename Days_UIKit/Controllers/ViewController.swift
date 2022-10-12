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
    
    var name: String = "Your event"
    
    var year: String = ""
    var month: String = ""
    var day: String = ""

    
//    var actualYear: String = ""
//    var actualMonth: String = ""
//    var actualDay: String = ""
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        event.text = "\(name)!"
        //label.text = "\(year):\(month):\(day)"
        let dayss = createCount(Y: year, M: month, D: day)

        label.text = "\(dayss)"
        
    }
  
    
    
    @IBAction func unwindToFirst(_ sender: UIStoryboardSegue) {
}
    func createCount(Y: String, M: String, D: String) -> Int {

        let present = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
        let pastDate = "\(M)/\(D)/\(Y)"
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MM/dd/yyyy"
        let pastDate2 = formatter1.date(from: pastDate)
       
        // Count seconds and days between dates

        let seconds = pastDate2?.distance(to: present!)

        
        var secondsInt = Int(seconds ?? 0)
        let days = (secondsInt / 86400)
        print(days)
        let negativeDays = -days
        
        return negativeDays
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
