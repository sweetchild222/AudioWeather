//
//  LocationTableViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 6..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class ViewLocationUpper: UITableViewController {
    
    var selected:Int = 0
    var type:ViewType = .Alarm
    
    enum ViewType:Int{
        
        case Weather, Alarm
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        let mapList = AddressMap.instance.mapList;
    
        return mapList.count + 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selected = indexPath.row
        
        if indexPath.row == 0{

            self.performSegue(withIdentifier: "unwindFromLocationID", sender: self)
            
        }
        else{
        
            self.performSegue(withIdentifier: "segueLocationLower", sender: self)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueLocationLower" {
            
            guard let view = segue.destination as? ViewLocationLower else{
                return
            }

            view.selectedUpper = selected - 1
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "CellUpperID"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }

        if indexPath.row == 0 {
            
            cell?.textLabel?.text = self.type == .Alarm ? AddressMap.instance.alarmLocation : AddressMap.instance.current
            
        }
        else{
            
            let mapList = AddressMap.instance.mapList;
            
            cell?.textLabel?.text = mapList[indexPath.row - 1].getUpper()
            
        }
        
        return cell!
    }

}
