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
    
    var year: String = "00"
    var month: String = "00"
    var day: String = "00"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        //load data
        loadData()
        
        //visual
        table.separatorStyle = .none
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshDateEvent()
    }
    
    
    func refreshDateEvent() {
        loadData()
        for i in dataEvent {
            print("\(i.name)")
            print("\(i.yearS):\(i.monthS):\(i.dayS)")
            
            _ = createCount(Y: i.yearS, M: i.monthS, D: i.dayS)
            saveData()
        }
    }
    
    
    func createCount(Y: String, M: String, D: String) -> String {

        let present = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
        print("date: \(Date())")
        
        let pastDate = "\(M)/\(D)/\(Y)"
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = C.dateFormat
        formatter1.timeZone = TimeZone(abbreviation: "CET")
        let pastDate2 = formatter1.date(from: pastDate)
       
        // Count seconds and days between dates
        let seconds = pastDate2?.distance(to: present!)

        let secondsInt = Int(seconds ?? 0)
        let daysInt = (secondsInt / 86400)
        let daysString = String(daysInt)
        
        return daysString
    }
    
    
    //MARK: - Manage Data, Save, load
    
    
    func saveData() {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: dataEvent, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: C.keyUserDefaults)
        }
    }
    
    
    func loadData() {
        let defaults = UserDefaults.standard

        if let savedIvents = defaults.object(forKey: C.keyUserDefaults) as? Data {
            if let decodedIvents = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedIvents) as? [DataEvent]  {
                dataEvent = decodedIvents
            }
        }
    }

  
    @IBAction func unwindToFirst(_ sender: UIStoryboardSegue) {
        addEvent(n: name)
    }
    
    
    func addEvent(n: String) {
        let dayCount = createCount(Y: year, M: month, D: day)
        
        dataEvent.append(DataEvent(name: n, day: dayCount, yearS: year, monthS: month, dayS: day))
        saveData()
        
        table.reloadData()
    }
    
    
//    func startTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCalculations), userInfo: nil, repeats: true)
//    }
//
//
//    @objc func timeCalculations() {
//        print("timer test")
//    }
    
    
    //MARK: - TableView delegate, data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEvent.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inerIvent = dataEvent[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.labelEvent.text = inerIvent.name
        cell.labelDay.text = "\(inerIvent.day) days!"
        
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
            saveData()
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
    
}
