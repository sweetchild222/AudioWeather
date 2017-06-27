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
        
        NotificationCenter.default.addObserver(self, selector: #selector(AlarmTableViewController.reloadAlarm), name: Notification.Name("reloadAlarm"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AlarmTableViewController.showRescent), name: Notification.Name("showRescent"), object: nil)
    }

    
    func showRescent(){
        
        AlarmManager().getRescentDate(completionHandler: { date in
            
            guard let xDate = date else{
                return
            }
            
            let hour = Calendar.current.dateComponents([.hour], from: Date(), to: xDate).hour!
            
            var message:String? = nil
            
            if hour > 0 {
                
                if hour > (24 * 5) {
                    
                    let day = Calendar.current.dateComponents([.day], from: Date(), to: xDate).day!
                    
                    message = "다음 알람은 \(day)일 후 입니다"
                }else{
                    
                    message = "다음 알람은 \(hour)시간 후 입니다"
                }
            }
            else{
                
                let minute = Calendar.current.dateComponents([.minute], from: Date(), to: xDate).minute!
                
                if minute == 0{
                    
                    let second = Calendar.current.dateComponents([.second], from: Date(), to: xDate).second!
                    
                    message = "다음 알람은 \(second)초 후 입니다"
                }
                else{
                
                    message = "다음 알람은 \(minute)분 후 입니다"
                }
            }
            
            
            guard let xMessage = message else{
                return
            }
            
            DispatchQueue.main.async {
                
                self.showToast(message:xMessage)
            }
        })
    }
    
    func showToast(message:String) {
        
        let width:CGFloat = 250.0
        let height:CGFloat = 40.0
        
        let label = UILabel(frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: (self.view.frame.size.height - height)/2, width: width, height: height))
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        label.textColor = UIColor.white
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = message
        label.alpha = 1.0
        label.layer.cornerRadius = 10;
        label.clipsToBounds  =  true
        self.view.addSubview(label)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            label.alpha = 0.0
        }, completion: {(isCompleted) in
            label.removeFromSuperview()
        })
    }
    
    
    func reloadAlarm() {
        
        tableView.reloadData()
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
        
        var alarm = editViewController.alarm
        
        let notiCount = alarm?.getNotificationCount()
        
        if (AlarmManager().getNotificationCount() + (notiCount)!) > 64{
            
            self.showToast(message:"설정한 알람 갯수가 너무 많습니다")
            alarm?.enabled = false
        }
        
        AlarmManager().alarms.insert(alarm!, at:0)
        
        AlarmManager().setNotification()
        
        if alarm?.enabled == true{
        
            showRescent()
        }
        
        self.tableView.reloadData()
        
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            AlarmManager().alarms.remove(at: indexPath.row)
            
            AlarmManager().setNotification()
            
            showRescent()
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
}
