//
//  ViewController.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 28/09/2022.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!

    let cellBluePrint = CustomTableViewCell()
    
    var ivent: [Ivent] = []

    var name: String = "Your event"
    var days: String = "x"
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        //visual
        table.separatorStyle = .none

        //load data
        let defaults = UserDefaults.standard

        if let savedIvents = defaults.object(forKey: "ivent") as? Data {
            if let decodedIvents = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedIvents) as? [Ivent]  {
                ivent = decodedIvents
            }
        }
    }
    




  
    @IBAction func unwindToFirst(_ sender: UIStoryboardSegue) {
        addEvent(n: name, d: days)
        
    }
    
    func addEvent(n: String, d: String) {
        
        // add func iDay timer -1 in one day
        ivent.append(Ivent(iName: n, iDay: d))
        save()
        //startTimer()

        
        table.reloadData()
        
        
    }
    
    

    
    //MARK: - TableView delegate, data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ivent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let inerIvent = ivent[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.labelEvent.text = inerIvent.iName
        cell.labelDay.text = "\(inerIvent.iDay) days!"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ivent.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            save()
        }
    }
    
    
    // Cell padding and corner radius
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x,
                                 y: cell.bounds.origin.y,
                                 width: cell.bounds.width,
                                 height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    

    //MARK: - Manage Data, Save
    
    func save() {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: ivent, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "ivent")
        }
    }

    

}



