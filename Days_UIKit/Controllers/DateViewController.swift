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

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let destVC = segue.destination as! ViewController
                destVC.name = text.text ?? "brak nazwy"

                let picketYear = date.date.formatted(.dateTime.year())
                let picketMonth = date.date.formatted(.dateTime.month(.twoDigits))
                let picketDay = date.date.formatted(.dateTime.day())
                
                destVC.year = picketYear
                destVC.month = picketMonth
                destVC.day = picketDay

            }
        
    }

   
