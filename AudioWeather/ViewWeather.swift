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
    var playWeather:PlayWeather? = nil
    var alert:UIAlertController? = nil
    var isPlayMode:Bool = false
    var currentAddress:Address? = nil
    
    
    @IBAction func refresh(_ sender: Any) {
        
        let address = selectedLocation()
        
        requestAll(address:address)
    }
    

    func playCore(address:Address){
        
        self.showAlert(address:address)
        
        self.playWeather = PlayWeather(address:address, completionHandler:{ error in
            
            self.closeAlert()
        })
        
        self.playWeather?.play()
    }
    
    
    @IBAction func play(_ sender: Any) {
        
        let address = selectedLocation()
        
        if address.getUpper() == AddressMap.instance.current{
            
            self.isPlayMode = true
            requestLocation()
        }
        else{
            
            playCore(address:address)
        }
    }
    

    func closeAlert(completion: (() -> Swift.Void)? = nil){
        
        guard let gAlert = self.alert else{
            return
        }

        gAlert.dismiss(animated: true, completion:completion)
    }
    
    
    func showAlert(address:Address){
        
        self.alert = UIAlertController(title: "\(address.getText()) 날씨", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "중단", style: .default) { (action:UIAlertAction)->Void in
            
            if self.playWeather == nil {
                return
            }
            
            self.playWeather?.stop()
            self.playWeather = nil

        }
        
        self.alert?.addAction(action)
        
        self.present(alert!, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 40) {
            
            self.alert?.dismiss(animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initLocation()
        
        let address = selectedLocation()
        
        requestAll(address:address)

    }

    
    func startLoadingAsync(){
        
        DispatchQueue.main.async{
            self.startLoading()
        }
    }

    
    func startLoading(){
        
        if self.loadingView != nil{
            
            self.stopLoading()
        }
        
        let width = self.tableView.frame.width
        let height = self.tableView.frame.height
        
        self.loadingView = LoadingView(parentWidth:width, parentHeight:height)
        self.tableView.addSubview(self.loadingView!)
        self.loadingView?.start()
        
    }
    
    func stopLoadingAsync(){
        
        DispatchQueue.main.async{
        
            self.stopLoading()
        }
        
    }
    
    
    func stopLoading(){
        
        if self.loadingView == nil{
            return
        }
        
        self.loadingView?.isHidden = true
        self.loadingView?.stop()
        self.loadingView?.removeFromSuperview()
        self.loadingView = nil
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
            
            requestWeatherDust(address: address, async:false)
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
        self.isPlayMode = false
    }

    
    func requestWeatherDust(address:Address, async:Bool){
        
        self.dustList = nil
        self.dataManager = nil
        
        if(async == true) {
            self.startLoadingAsync()
        }
        else {
            self.startLoading()
        }
        
        requestWeather(address:address)
        requestDust()
    }
    
    

    func requestAddr(lat:Double, lgt:Double){
        
        AddrRequester.instance.request(lat:lat, lgt:lgt){ response in
            
            guard let address = response else {
                
                self.showError(error:"현재 지역 정보를 가져 올 수 없습니다. 네트워크 상태를 확인 해주세요")
                self.isPlayMode = false
                return
            }
            
            
            self.currentAddress = address
            
            DispatchQueue.main.async {
                
                self.tableView.reloadRows(at: [IndexPath(item: 0, section: 0)], with: .fade)
            }


            if self.isPlayMode == true{

                self.isPlayMode = false
                self.playCore(address:address)
            }
            else{
                self.requestWeatherDust(address:address, async:true)
            }
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
        
        cellWeatherLocation.updateLocation(address:address, currentAddress:self.currentAddress)
        
    }
    
    
    
    func updateDustCell(cell:UITableViewCell) {
        
        guard let cellDust = (cell as? CellDust) else{
            return
        }
        
        guard let dustList = self.dustList else{
            return
        }
        

        let address = selectedLocation()
        
        cellDust.update(address:address.getUpper() == AddressMap.instance.current ? self.currentAddress : address, dustList:dustList)
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
            
            self.stopLoadingAsync()
            
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
            
            self.stopLoadingAsync()
            
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
        
        self.currentAddress = nil
        
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
