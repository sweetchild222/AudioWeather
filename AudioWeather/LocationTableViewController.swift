//
//  LocationTableViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 6..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        let mapList = AddressMap.instance.mapList;
        
        return mapList.count
        
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let mapList = AddressMap.instance.mapList;
    
        return mapList[section].lowerList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let mapList = AddressMap.instance.mapList;
        
        
        return mapList[section].getUpper()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let identifier = "locationListID"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        
        
        let mapList = AddressMap.instance.mapList;
        
        cell?.textLabel?.text = mapList[indexPath.section].getLowerList()[indexPath.row].getLower()
        
        return cell!
    }

}
