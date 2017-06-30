//
//  ViewLocationLower.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 27..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class ViewLocationLower: UITableViewController {

    var selectedUpper:Int = 0
    var selectedLower:Int = 0
    

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
        
        return mapList[self.selectedUpper].lowerList.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedLower = indexPath.row
        
        self.performSegue(withIdentifier: "unwindFromLocationID", sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "CellLowerID"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        
        let mapList = AddressMap.instance.mapList;
            
        cell?.textLabel?.text = mapList[self.selectedUpper].getLowerList()[indexPath.row].getLower()
        
        return cell!
    }

}
