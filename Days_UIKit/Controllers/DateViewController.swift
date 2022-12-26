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
        setupUI()
        
        shadowText(element: text)
        shadowButton(element: buttonDone)
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! ViewController
        destVC.name = text.text ?? "unknown name"
        
        let picketYear = date.date.formatted(.dateTime.year())
        let picketMonth = date.date.formatted(.dateTime.month(.twoDigits))
        let picketDay = date.date.formatted(.dateTime.day())
        
        destVC.year = picketYear
        destVC.month = picketMonth
        destVC.day = picketDay
        
        
//      Zarządzanie odliczaniem do oraz od daty
//        let days = createCount(Y: picketYear, M: picketMonth, D: picketDay)
        
//        if stateDownOrUp == true {
//            destVC.days = String(days * -1)
//
//        } else {
//            destVC.days = String(days)
//
//        }
        
    }
    
    func setupUI() {
        date.overrideUserInterfaceStyle = .dark
    }
    
    
    @IBAction func didTapSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            stateDownOrUp = true
        } else if sender.selectedSegmentIndex == 1 {
            stateDownOrUp = false
            
        }
    }

    
    func configureKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func shadowText(element: UITextField) {
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOffset = CGSize(width: 5, height: 5)
        element.layer.shadowRadius = 5
        element.layer.shadowOpacity = 0.25
        
        text.delegate = self
    }
    
    
    func shadowButton(element: UIButton) {
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOffset = CGSize(width: 5, height: 5)
        element.layer.shadowRadius = 5
        element.layer.shadowOpacity = 0.25
    }


    
}

   
