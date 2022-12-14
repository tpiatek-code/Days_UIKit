//
//  DateViewController.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 28/09/2022.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var stateDownOrUp = true
    
    @IBOutlet weak var buttonDone: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.overrideUserInterfaceStyle = .dark
        
        shadowText(element: text)
        shadowButton(element: buttonDone)
    }
    
    
    func shadowText(element: UITextField) {
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOffset = CGSize(width: 5, height: 5)
        element.layer.shadowRadius = 5
        element.layer.shadowOpacity = 0.25
    }
    
    func shadowButton(element: UIButton) {
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOffset = CGSize(width: 5, height: 5)
        element.layer.shadowRadius = 5
        element.layer.shadowOpacity = 0.25
    }


    @IBAction func didTapSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            stateDownOrUp = true
        } else if sender.selectedSegmentIndex == 1 {
            stateDownOrUp = false
            
        }
    }
    
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! ViewController
        destVC.name = text.text ?? "unknown name"
        
        let picketYear = date.date.formatted(.dateTime.year())
        let picketMonth = date.date.formatted(.dateTime.month(.twoDigits))
        let picketDay = date.date.formatted(.dateTime.day())
        
        let days = createCount(Y: picketYear, M: picketMonth, D: picketDay)
        
        if stateDownOrUp == true {
            destVC.days = String(days * -1)

        } else {
            destVC.days = String(days)

        }
    }

    
    func createCount(Y: String, M: String, D: String) -> Int {

        let present = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
        let pastDate = "\(M)/\(D)/\(Y)"
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MM/dd/yyyy"
        let pastDate2 = formatter1.date(from: pastDate)
       
        // Count seconds and days between dates
        let seconds = pastDate2?.distance(to: present!)
        
        let secondsInt = Int(seconds ?? 0)
        let days = (secondsInt / 86400)
        
        return days
    }
    
    
    
    
    
}

   
