//
//  EditViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit


protocol PickDateDelegate
{
    func selectFixDateHandler(date:Date)
}


class EditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PickDateDelegate{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmDateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var locationSection:Int = 0
    var locationRow:Int = 0
    
    var todayTomorrowDate = Date()
    var fixDate = Date()
    var weekChecked = [Bool](repeating:false, count:7)
    var selectedDateType:dateType = .todayTomorrow
    var repeatCount:Int = 3
    
    var alarm:Alarm = Alarm()
    
    enum dateType{
        
        case todayTomorrow, fixDate, week
    }

    @IBAction func test(_ sender: Any) {
        print("gadfa")
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        initTableSeperator()
        initDatePickerSeperator()
        
        self.todayTomorrowDate = correctAlarm(date: Date())
        
        updateTodayTomorrowLabel()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    
    func initDatePickerSeperator(){
        
        guard let guardDatePickerView = datePicker else{
            
            return
        }
        
        let border = CALayer()
        border.frame = CGRect.init(x: 0, y: 0, width: guardDatePickerView.frame.width, height: 1 / UIScreen.main.scale)
        border.backgroundColor = UIColor(red: 205/255.0, green: 205/255.0, blue: 205/255.0, alpha: 1.0).cgColor;
        
        guardDatePickerView.layer.addSublayer(border)
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
    
    
    func selectedLocation() -> (upper:String, lower:String){
        
        if self.locationSection == 0{
            
            return (AddressMap.instance.cuurent, "")

        }
        else{
            
            let mapList = AddressMap.instance.mapList
            
            let locationUpper = mapList[self.locationSection - 1].getUpper()
            let locationLower = mapList[self.locationSection - 1].getLowerList()[locationRow].getLower()
            
            return (locationUpper, locationLower)
        }
    }
    
    
    func updateLocationCell(cell:UITableViewCell) {
        
        guard let locationCell = (cell as? TableViewCellLocation) else{
            return
        }
        
        let location = selectedLocation()
        
        locationCell.updateLocation(location:location.upper + " " + location.lower)

    }
    
    
    func updateWeekCell(cell:UITableViewCell){
        
        guard let weekCell = (cell as? TableViewCellWeek) else{
            return
        }
        
        weekCell.updateChecked(checked:self.weekChecked)
        
    }
    
    @IBAction func showDatePicker(_ sender: Any) {
        
        let popUp: DatePickerPopUp = UINib(nibName: "DatePickerPopUp", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! DatePickerPopUp
        
        popUp.frame = self.view.frame
        popUp.delegate = self
        
        self.view.addSubview(popUp)
        
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
        else if indexPath.row == 0{

            updateWeekCell(cell:cell!)
        }
        
        return cell!
    }
    
    
    func makeFixDate() -> Date{
    
        let calendar = Calendar.current

        let year = calendar.component(.year, from: self.fixDate)

        let month = calendar.component(.month, from: self.fixDate)

        let day = calendar.component(.day, from: self.fixDate)

        let hour = calendar.component(.hour, from: self.todayTomorrowDate)

        let minute = calendar.component(.minute, from: self.todayTomorrowDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd/HH:mm:ss"
        let stringTime = "\(year)-\(month)-\(day)/\(hour):\(minute):0"
        
        let date = dateFormatter.date(from: stringTime)
        
        return date!

    }

    
    @IBAction func touchedRepeat(_ sender: Any) {
        
        let button = sender as? UIButton
        
        let text = button?.titleLabel?.text
        
        self.repeatCount = Int(text!)!
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        let alarm:Alarm = Alarm()
        
        alarm.repeatCount = self.repeatCount
        alarm.enabled = true
        alarm.location = selectedLocation()
        
        switch selectedDateType{
            
        case .week:
            alarm.date = self.todayTomorrowDate
            alarm.repeatWeek = self.weekChecked
            
        case .fixDate:
            alarm.date = makeFixDate()
            
        case .todayTomorrow:
            alarm.date = self.todayTomorrowDate
        }
        
        
        self.alarm = alarm
        
        self.performSegue(withIdentifier: "unwindToAlarm", sender: self)
        
    }

    func correctAlarm(date:Date) -> Date{
        
        
        let calendar = Calendar.current
        let second = calendar.component(.second, from: date)
        
        let pickDate = calendar.date(byAdding: .second, value: -second, to: date)
        
        
        let pickHour = calendar.component(.hour, from: pickDate!)
        let pickMinutes = calendar.component(.minute, from: pickDate!)
        
        let currentHour = calendar.component(.hour, from: Date())
        let currentMinutes = calendar.component(.minute, from: Date())
        
        if pickHour == currentHour {
            
            if pickMinutes <= currentMinutes{
                
                return calendar.date(byAdding: .day, value: 1, to: pickDate!)!
            }
            else{

                return pickDate!
            }
        }
        else if pickHour < currentHour {
            
            return calendar.date(byAdding: .day, value: 1, to: pickDate!)!
        }
        else{
            
            return pickDate!
        }
    }
    
    
    func isCheckedWeek() -> Bool{
        
        for checked in  self.weekChecked{
            
            if checked == true{
                
                return true
            }
        }
        
        return false
    }
    
    
    func uncheckedWeek() {
        
        for index in 0..<weekChecked.count{
            
            self.weekChecked[index] = false
        }
    }
    
    
    func selectFixDateHandler(date:Date) {
        
        self.fixDate = date
        
        selectedDateType = .fixDate
        
        updateFixDateLabel()
        
        uncheckedWeek()
    }

    
    @IBAction func touchedWeek(_ sender: Any) {
        
        let button = sender as! ButtonCheck
        
        let text = button.titleLabel?.text
        
        guard let guardText = text else{
            return
        }
        
        let weekString = ["일", "월", "화", "수", "목", "금", "토"]
        
        var index = 0
        
        for week in weekString{
            
            if week == guardText {
                
                self.weekChecked[index] = button.isChecked
                break
            }
            
            index += 1
        }
        
        if isCheckedWeek() == true {
        
            selectedDateType = .week
            
            updateWeekLabel()
            
            tableView.reloadData()
        }
        else{
            
            selectedDateType = .todayTomorrow
            
            updateTodayTomorrowLabel()
        }
    }
    
    
    func updateTodayTomorrowLabel(){
        
        let weekInt = Calendar.current.component(.weekday, from: self.todayTomorrowDate)
        let today = Calendar.current.isDateInToday(self.todayTomorrowDate)
        
        let dateFormatter = DateFormatter()
        
        let weekString = ["일", "월", "화", "수", "목", "금", "토"]
        
        dateFormatter.dateFormat = (today == true ? "오늘 - " : "내일 - ") + "M월 d일 (" + weekString[weekInt - 1] + ")"
        self.alarmDateLabel.text = dateFormatter.string(from: self.todayTomorrowDate)
    }
    
    
    func updateFixDateLabel(){
        
        let dateFormatter = DateFormatter()
        let weekInt = Calendar.current.component(.weekday, from: self.fixDate)
        
        let weekString = ["일", "월", "화", "수", "목", "금", "토"]
        
        dateFormatter.dateFormat = "M월 d일 (" + weekString[weekInt - 1] + ")"
        
        self.alarmDateLabel.text = dateFormatter.string(from: self.fixDate)
        
    }
    
    
    func updateWeekLabel(){
        
        let weekString = ["일", "월", "화", "수", "목", "금", "토"]
        
        var text:String = ""
        
        for index in 0..<self.weekChecked.count {
            
            if self.weekChecked[index] == true {
            
                text += (weekString[index] + ", ")
            }
        }
        

        self.alarmDateLabel.text = String(text.characters.dropLast(2))
    }
    
    
    
    @IBAction func timeChanged(_ sender: Any) {
        
        guard let picker = sender as? UIDatePicker else{
            return
        }
        
        self.todayTomorrowDate = correctAlarm(date:picker.date)
        
        
        if selectedDateType == .todayTomorrow {
            
            updateTodayTomorrowLabel()
        }
    }

    
    @IBAction func unwindToEdit(segue: UIStoryboardSegue){
        
        guard let locationController = segue.source as? LocationTableViewController else {
            return
        }
        
        self.locationSection = locationController.selectedSection
        self.locationRow = locationController.selectedRow
    }
    
}
