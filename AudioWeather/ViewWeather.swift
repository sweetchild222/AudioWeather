//
//  ViewWeather.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 29..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

import CoreLocation

class ViewWeather: UITableViewController, CLLocationManagerDelegate {
    
    var loadingView:LoadingView? = nil
    
    var dataManager:WeatherDataManager? = nil
    var dustList:[String: [String: DustRequester.Grade]]? = nil
    
    let locationManager = CLLocationManager()
    var locationFixAchieved:Bool = false


    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initLocation()
        
        let address = selectedLocation()
        
        requestAll(address:address)

    }
    

    func startLoading(){
        
        let width = self.tableView.frame.width
        let height = self.tableView.frame.height
        
        self.loadingView = LoadingView(parentWidth:width, parentHeight:height)
        self.tableView.addSubview(self.loadingView!)
        self.loadingView?.start()
    }
    
    
    func stopLoading(){
        
        self.loadingView?.isHidden = true
        self.loadingView?.stop()
        self.loadingView?.removeFromSuperview()
    
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    

    func cellIdentifier(row:Int) -> String{
        
        switch(row){
            
        case 0:
            return "CellLocationID"
        case 1:
            return "CellDustID"
        case 2:
            return "CellCurrentID"
        case 3:
            return "CellClosedID"
        case 4:
            return "CellSpaceID"
        default:
            return "CellDefaultID"
            
        }
    }
    
    
    func selectedLocation() -> Address{
        
        let isCurrent = SelectedLocationManager.instance.isCurrent()
        let upper = SelectedLocationManager.instance.getUpper()
        let lower = SelectedLocationManager.instance.getLower()
        
        if isCurrent == true {

            return Address(upper:AddressMap.instance.current, lower:String())
        }
        else{
            
            let mapList = AddressMap.instance.mapList
            
            let locationUpper = mapList[upper].getUpper()
            let locationLower = mapList[upper].getLowerList()[lower].getLower()
            
            return Address(upper:locationUpper, lower:locationLower)
        }
    }
    
    
    func requestAll(address:Address){
        
        if address.getUpper() == AddressMap.instance.current{
            
            requestLocation()
        }
        else{
            
            requestWeatherDust(address: address)
        }
    }
    
    
    func initLocation(){
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        }
    }
    
    
    func requestLocation(){
        
        locationFixAchieved = false
        self.locationManager.requestLocation()
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locationFixAchieved == false {
            
            locationFixAchieved = true
            
            let location = locations.last! as CLLocation
            
            requestAddr(lat:location.coordinate.latitude, lgt:location.coordinate.longitude)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.showError(error:"현재 위치 정보를 가져 올 수 없습니다. GPS 상태를 확인 해주세요")
    }

    
    func requestWeatherDust(address:Address){
        
        self.dustList = nil
        self.dataManager = nil

        startLoading()
        
        
        //print("reqeust \(address.getLower())")
        requestWeather(address:address)
        requestDust()
    }
    
    

    func requestAddr(lat:Double, lgt:Double){
        
        AddrRequester.instance.request(lat:lat, lgt:lgt){ response in
            
            guard let address = response else {
                
                self.showError(error:"현재 지역 정보를 가져 올 수 없습니다. 네트워크 상태를 확인 해주세요")
                return
            }
            
            self.requestWeatherDust(address:address)
        }
    }
    
    
    func showError(error:String){
        
        let alert = UIAlertController(title: error, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func updateLocationCell(cell:UITableViewCell) {
        
        guard let cellWeatherLocation = (cell as? CellWeatherLocation) else{
            return
        }
        
        let address = selectedLocation()
        
        cellWeatherLocation.updateLocation(address:address)
        
    }
    
    
    
    func updateDustCell(cell:UITableViewCell) {
        
        guard let cellDust = (cell as? CellDust) else{
            return
        }
        
        guard let dustList = self.dustList else{
            return
        }
        
        cellDust.update(dustList:dustList)
    }

    
    func updateCurrentCell(cell:UITableViewCell) {
        
        guard let cellCurrent = (cell as? CellCurrent) else{
            return
        }
        

        guard let dataCurrent = self.dataManager?.dataCurrent else{
            return
        }
        
        cellCurrent.updateData(dataCurrent:dataCurrent)
    }
    
    
    func updateClosedCell(cell:UITableViewCell) {
        

        guard let cellClosed = (cell as? CellClosed) else{
            return
        }
        
        
        guard let dataClosed = self.dataManager?.dataClosed else{
            return
        }
            
        cellClosed.update(dataClosed:dataClosed)
    }
    
    
    
    func updateSpaceCell(cell:UITableViewCell) {
        
        guard let cellSpace = (cell as? CellSpace) else{
            return
        }
        
        guard let dataSpace = self.dataManager?.dataSpace else{
            return
        }
        
        cellSpace.update(dataSpace:dataSpace)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 3{
            
            self.stopLoading()
            //tableView.beginUpdates()
            //tableView.endUpdates()
            
            //let identifier = cellIdentifier(row: 3)
            
            //var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = cellIdentifier(row: indexPath.row)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil) {
            
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        
        cell?.preservesSuperviewLayoutMargins = false
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.layoutMargins = UIEdgeInsets.zero
        
        if indexPath.row == 0{
            
            updateLocationCell(cell:cell!)
        }
        else if indexPath.row == 1{
            
            updateDustCell(cell:cell!)
        }
        else if indexPath.row == 2{
            
            updateCurrentCell(cell:cell!)
        }
        else if indexPath.row == 3{
            
            updateClosedCell(cell:cell!)
        }
        else if indexPath.row == 4{
            
            updateSpaceCell(cell:cell!)
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
            
            DispatchQueue.main.async {
                
                self.tableView.reloadRows(at: [IndexPath(item: 2, section: 0), IndexPath(item: 3, section: 0), IndexPath(item: 4, section: 0)], with: .fade)
            }
        }
    }
    
    
    
    func requestDust(){
        
        DustRequester.instance.request(){ response in
            
            self.stopLoading()
            
            guard let value = response, value.isEmpty == false else {
                
                return
            }
            
            self.dustList = value
            
            DispatchQueue.main.async {
            
                self.tableView.reloadRows(at: [IndexPath(item: 1, section: 0)], with: .fade)
            }
        }
    }
    
    
    func adjustSelectedLower(segue: UIStoryboardSegue) -> Bool{
    
        guard let view = segue.source as? ViewLocationLower else {
            return false
        }
        
        SelectedLocationManager.instance.setIsCurrent(isCurrent: false)
        SelectedLocationManager.instance.setUpper(upper:view.selectedUpper)
        SelectedLocationManager.instance.setLower(lower:view.selectedLower)
        
        return true
    }
    
    
    func adjustSelectedUpper(segue: UIStoryboardSegue) -> Bool{
        
        guard segue.source is ViewLocationUpper else {
            return false
        }
        
        SelectedLocationManager.instance.setIsCurrent(isCurrent: true)
        SelectedLocationManager.instance.setUpper(upper:0)
        SelectedLocationManager.instance.setLower(lower:0)
        
        return true
    }
    
    
    
    @IBAction func unwindFromLocation(segue: UIStoryboardSegue){
        
        if adjustSelectedUpper(segue: segue) == true{
            
            self.tableView.reloadRows(at: [IndexPath(item: 0, section: 0)], with: .fade)
            
            let address = selectedLocation()
            
            requestAll(address:address)

            return
        }
        
        if adjustSelectedLower(segue: segue) == true{
            
            self.tableView.reloadRows(at: [IndexPath(item: 0, section: 0)], with: .fade)
            
            let address = selectedLocation()
            
            requestAll(address:address)

            return
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueLocationUpper" {
            
            guard let view = segue.destination as? ViewLocationUpper else{
                return
            }
            
            view.type = .Weather
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
