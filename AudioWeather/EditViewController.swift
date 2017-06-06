//
//  EditViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var locationSection:Int = 0
    var locationRow:Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        initTableSeperator()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    
    func initTableSeperator(){
        
        guard let guardTableView = tableView else{
            
            return
        }
        
        let line: UIView = UIView(frame: CGRect(x: 0, y: 0, width: guardTableView.frame.size.width, height: 1 / UIScreen.main.scale))
        line.backgroundColor = guardTableView.separatorColor
        guardTableView.tableHeaderView = line
        
        guardTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pickDate(_ sender: Any) {
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableCellIdentifier(row:Int) -> String{
        
        switch(row){
            
        case 0:
            return "weekTableCell"
        case 1:
            return "repeatTableCell"
        case 2:
            return "locationTableCell"
        default:
            return "defaultCell"

        }
    }
    
    
    func updateLocationCell(cell:UITableViewCell) {
        
        guard let locationCell = (cell as? TableViewCellLocation) else{
            return
        }
        
        if self.locationSection == 0{
            
            locationCell.updateLocation(location:"현재 위치")
        }
        else{
            
            let mapList = AddressMap.instance.mapList
            
            let locationUpper = mapList[self.locationSection - 1].getUpper()
            let locationLower = mapList[self.locationSection - 1].getLowerList()[locationRow].getLower()
            
            locationCell.updateLocation(location:locationUpper + " " + locationLower)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = tableCellIdentifier(row: indexPath.row)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        
        cell?.preservesSuperviewLayoutMargins = false
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.layoutMargins = UIEdgeInsets.zero
        
        if indexPath.row == 2{
            
            updateLocationCell(cell:cell!)
        }

    
        return cell!
    }
    
    @IBAction func unwindToEdit(segue: UIStoryboardSegue){
        
        guard let locationController = segue.source as? LocationTableViewController else {
            return
        }
        
        self.locationSection = locationController.selectedSection
        self.locationRow = locationController.selectedRow
    }
}
