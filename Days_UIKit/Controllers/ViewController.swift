//
//  ViewController.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 28/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!

    let cellBluePrint = CustomTableViewCell()
    var timer = Timer()
    
    var dataEvent: [DataEvent] = []

    var name: String = "Your event"
    var days: String = "x"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        //visual
        table.separatorStyle = .none
        
        //load data
        loadData()
        //AAA development branch
    }
    
    
    func loadData() {
        let defaults = UserDefaults.standard

        if let savedIvents = defaults.object(forKey: "ivent") as? Data {
            if let decodedIvents = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedIvents) as? [DataEvent]  {
                dataEvent = decodedIvents
            }
        }
    }

  
    @IBAction func unwindToFirst(_ sender: UIStoryboardSegue) {
        addEvent(n: name, d: days)
        //startTimer()
        startTimer()
    }
    
    
    func addEvent(n: String, d: String) {
        
        // add func iDay timer -1 in one day
        dataEvent.append(DataEvent(iName: n, iDay: d))
        save()
        
        table.reloadData()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCalculations), userInfo: nil, repeats: true)
    }
    
    
    @objc func timeCalculations() {
        print("timer test")
    }
    
    
    //MARK: - TableView delegate, data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEvent.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inerIvent = dataEvent[indexPath.row]
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
    
    //edit row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataEvent.remove(at: indexPath.row)
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
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: dataEvent, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "ivent")
        }
    }

    

}



