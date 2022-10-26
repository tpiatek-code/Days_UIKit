//
//  ViewController.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 28/09/2022.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    
    let dataIvent = Ivent(iName: "", iDay: "")
    let cellBluePrint = CustomTableViewCell()
    
    var data = [
        Ivent(iName: "Vacation!", iDay: "20"),
        Ivent(iName: "happy New Year!", iDay: "156"),
        Ivent(iName: "Trip!", iDay: "502")
]
    
    
    var name: String = "Your event"
    var days: String = ""

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        table.dataSource = self


        
    }
  
    @IBAction func unwindToFirst(_ sender: UIStoryboardSegue) {
        addEvent(n: name, d: days)
}
    
    func addEvent(n: String, d: String) {
        data.append(Ivent(iName: n, iDay: d))
        table.reloadData()
    }

    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let inerIvent = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.labelEvent.text = inerIvent.iName
        cell.labelDay.text = inerIvent.iDay
        
        return cell
    }
 
}
