//
//  EditViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var RepeatFive: ButtonRepeat!
    @IBOutlet weak var RepeatThree: ButtonRepeat!
    @IBOutlet weak var RepeatOne: ButtonRepeat!

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        initTableSeperator()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifer = tableCellIdentifier(row: indexPath.row)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifer)
        }

        cell?.preservesSuperviewLayoutMargins = false
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.layoutMargins = UIEdgeInsets.zero
        
        return cell!
    }
    


}
