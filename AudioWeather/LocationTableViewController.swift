//
//  LocationTableViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 6..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController {
    
    var selectedSection:Int = 0
    var selectedRow:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        let mapList = AddressMap.instance.mapList;
        
        return mapList.count + 1
        
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if section == 0{
            
            return 1
        }
        
        let mapList = AddressMap.instance.mapList;
    
        return mapList[section - 1].lowerList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40.0
    }

    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            
            return AddressMap.instance.cuurent
        }
        
        let mapList = AddressMap.instance.mapList;
    
        return mapList[section - 1].getUpper()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedSection = indexPath.section
        self.selectedRow = indexPath.row
        
        self.performSegue(withIdentifier: "unwindToEdit", sender: self)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "locationListID"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        

        if indexPath.section == 0 {
            
            cell?.textLabel?.text = AddressMap.instance.cuurent
            
        }
        else{
            
            let mapList = AddressMap.instance.mapList;
            
            cell?.textLabel?.text = mapList[indexPath.section - 1].getLowerList()[indexPath.row].getLower()
            
        }
        
        return cell!

    }

}
