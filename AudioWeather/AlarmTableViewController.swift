//
//  AlarmTableViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class AlarmTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AlarmManager().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "alarmTableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let alarm = AlarmManager().alarms[indexPath.row]
        
        updateAlarm(cell:cell, uuid:alarm.uuid)
        
        return cell
    }

    
    
    func updateAlarm(cell:UITableViewCell, uuid: String){
        
        guard let alarmCell = (cell as? TableViewCellAlarm) else{
            return
        }
        
        alarmCell.updateAlarm(uuid:uuid)
        
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    @IBAction func unwindToAlarm(segue: UIStoryboardSegue){
        
        guard let editViewController = segue.source as? EditViewController else {
            return
        }
        
        let alarm = editViewController.alarm
        
        AlarmManager().alarms.insert(alarm!, at:0)
        
        self.tableView.reloadData()
        
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            AlarmManager().alarms.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
}
