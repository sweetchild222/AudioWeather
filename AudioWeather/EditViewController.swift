//
//  EditViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        addSeperatorOnTop()
    }

    
    func addSeperatorOnTop(){
        
        guard let guardTableView = tableView else{
            
            return
        }
        
        let px = 1 / UIScreen.main.scale
        let frame = CGRect(x: 0, y: 0, width: guardTableView.frame.size.width, height: px)
        let line: UIView = UIView(frame: frame)
        guardTableView.tableHeaderView = line
        line.backgroundColor = guardTableView.separatorColor

        
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
        
        return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifer = indexPath.row == 0 ? "weekTableCell" : "default"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifer)
        }

        if indexPath.row != 0 {
            
            cell?.textLabel?.text = "gge"
            cell?.detailTextLabel?.text = "232234"
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        
        
        
        cell?.preservesSuperviewLayoutMargins = false
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.layoutMargins = UIEdgeInsets.zero

        
        return cell!
    }
    


}
