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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.overrideUserInterfaceStyle = .dark

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToNext" {
            let destVC = segue.destination as! ViewController
            if let nameCheck = text.text {
                
                destVC.name = nameCheck
                
                let picketYear = date.date.formatted(.dateTime.year())
                let picketMonth = date.date.formatted(.dateTime.month(.twoDigits))
                let picketDay = date.date.formatted(.dateTime.day())
                let picketDate = date.date.formatted(date: .numeric, time: .omitted)
                
                
                destVC.year = picketYear
                destVC.month = picketMonth
                destVC.day = picketDay
                //destVC.selectDate = picketDate
                
                
            }
        
    }
  
    }
    
}
