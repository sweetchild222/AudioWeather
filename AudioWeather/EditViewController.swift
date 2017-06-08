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
    func selectDate(date:Date)
}


class EditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PickDateDelegate{
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmDateLabel: UILabel!
    
    var locationSection:Int = 0
    var locationRow:Int = 0
    
    var selectedDate = Date()
    var selectedWeek = [Bool](repeating:false, count:7)
    var selectedDateType:dateType = .todayTomorrow
    
    enum dateType{
        
        case todayTomorrow, fixDate, week
    }

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        initTableSeperator()
        initDatePickerSeperator()
        
        updateDateLabel(date:Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }

    
    func initDatePickerSeperator(){
        
        guard let guardDatePickerView = datePicker else{
            
            return
        }
        
        let frame = guardDatePickerView.frame
        
        let border = CALayer()
        border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: 1 / UIScreen.main.scale)
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func selectDate(date:Date) {
        
        self.selectedDate = date
        
        selectedDateType = .fixDate
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
    
    
    
    func weekToString(week:Int) -> String{
        
        switch week{
            
        case 1:
            return "일"
        case 2:
            return "월"
        case 3:
            return "화"
        case 4:
            return "수"
        case 5:
            return "목"
        case 6:
            return "금"
        case 7:
            return "토"
        default:
            return "일"
        }
    }
    
    
    func isCheckedWeek() -> Bool{
        
        for checked in  selectedWeek{
            if checked == true{
                return true
            }
        }
        
        return false
    }
    

    
    @IBAction func touchedWeek(_ sender: Any) {
        
        let button = sender as! ButtonCheck
        
        let text = button.titleLabel?.text
        
        guard let guardText = text else{
            return
        }
        
        let checked = button.isChecked ? true : false
        
        switch guardText {
            
        case "일":
            selectedWeek[0] = checked
        case "월":
            selectedWeek[1] = checked
        case "화":
            selectedWeek[2] = checked
        case "수":
            selectedWeek[3] = checked
        case "목":
            selectedWeek[4] = checked
        case "금":
            selectedWeek[5] = checked
        case "토":
            selectedWeek[6] = checked
        default:
            selectedWeek[0] = checked
            
        }
        

        if isCheckedWeek() == true {
        
            selectedDateType = .week
        }
        else{
            
            selectedDateType = .todayTomorrow
        }
        
    }
    
    
    
    func updateDateLabel(date:Date){
        
        let week = Calendar.current.component(.weekday, from: date)
        let today = Calendar.current.isDateInToday(date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = (today == true ? "오늘 - " : "내일 - ") + "M월 d일 (" + weekToString(week:week) + ")"
        self.alarmDateLabel.text = dateFormatter.string(from: date)
        
    }
    
    @IBAction func timeChanged(_ sender: Any) {
        
        guard let picker = sender as? UIDatePicker else{
            return
        }
        

        let date = correctAlarm(date:picker.date)
        
        updateDateLabel(date:date)
        
    }

    
    @IBAction func unwindToEdit(segue: UIStoryboardSegue){
        
        guard let locationController = segue.source as? LocationTableViewController else {
            return
        }
        
        self.locationSection = locationController.selectedSection
        self.locationRow = locationController.selectedRow
    }
    
    
    @IBAction func selectDate(_ sender: Any) {
        
        let popUp: DatePickerPopUp = UINib(nibName: "DatePickerPopUp", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! DatePickerPopUp
    
        popUp.frame = self.view.frame
        popUp.delegate = self
        
        self.view.addSubview(popUp)
    }
}
