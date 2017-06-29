//
//  ViewWeather.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 29..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class ViewWeather: UITableViewController {
    
    var loadingView:LoadingView? = nil
    
    var dataManager:WeatherDataManager? = nil
    var dustList:[String: [String: DustRequester.Grade]]? = nil
    
    var isCurrentLocation:Bool = true
    var locationUpper:Int = 3
    var locationLower:Int = 2

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let width = self.tableView.frame.width
        let height = self.tableView.frame.height

        self.loadingView = LoadingView(parentWidth:width, parentHeight:height)
        self.tableView.addSubview(self.loadingView!)
        
        startLoading()
        
        //requestWeather(address: Address(upper:"서울특별시", lower:"동작구"))
        //requestDust()
    }
    
    
    func startLoading(){
        
        self.loadingView?.start()
    }
    
    func stopLoading(){
        
        self.loadingView?.stop()
        self.loadingView?.isHidden = true
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
        
        return 0
    }

    

    func cellIdentifier(section:Int) -> String{
        
        switch(section){
            
        case 0:
            return "CellLocationID"
        default:
            return "CellDefaultID"
            
        }
    }
    
    
    
    func selectedLocation() -> Address{
        
        if self.isCurrentLocation == true {
            
            return Address(upper:AddressMap.instance.current, lower:String())
            
        }
        else{
            
            let mapList = AddressMap.instance.mapList
            
            let locationUpper = mapList[self.locationUpper].getUpper()
            let locationLower = mapList[self.locationUpper].getLowerList()[self.locationLower].getLower()
            
            return Address(upper:locationUpper, lower:locationLower)
        }
    }
    
    
    
    func updateReloadCell(cell:UITableViewCell) {
        
        guard let cellWeatherLocation = (cell as? CellWeatherLocation) else{
            return
        }
        
        let address = selectedLocation()
        
        cellWeatherLocation.updateLocation(address:address)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = cellIdentifier(section: indexPath.section)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        
        cell?.preservesSuperviewLayoutMargins = false
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.layoutMargins = UIEdgeInsets.zero
        
        if indexPath.section == 0{
            
            updateReloadCell(cell:cell!)
        }
        
        return cell!
    }
    
    
    func requestWeather(address:Address){
        
        guard let location = AddressMap.instance.getLocation(addr:address) else{
            
            return
        }
        
        let lat = location.lat
        let lgt = location.lgt
        
        WeatherRequester.instance.request(lat:lat, lgt:lgt){ response in
            
            self.stopLoading()
            
            guard let value = response else {

                return
            }
            
            self.dataManager = value
            
            
            self.tableView.reloadSections(IndexSet(integer: 0), with: .right)
        }
    }
    
    
    
    func requestDust(){
        
        DustRequester.instance.request(){ response in
            
            self.stopLoading()
            
            guard let value = response, value.isEmpty == false else {
                
                return
            }
            
            self.dustList = value
            
            self.tableView.reloadSections(IndexSet(integer: 1), with: .right)
        }
    }
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}