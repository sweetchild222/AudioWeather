//
//  CellClosed.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 30..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellClosed: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func updateData(data:WeatherData){
    
        let view: CellWeatherData = UINib(nibName: "CellWeatherData", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! CellWeatherData
        view.updateData(data:data)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 70)
        
        constraint.isActive = true
        constraint.priority = 999
        
        self.stackView.addArrangedSubview(view)
    }
    
    
    
    func cleanAll(){
        
        let views = self.stackView.arrangedSubviews
        
        for view in views{
            
            let dataView = view as! CellWeatherData
            
            dataView.clean()
            
            self.stackView.removeArrangedSubview(dataView)
        }
    }
    
    
    func update(dataClosed:WeatherDataClosed){
        
        cleanAll()
        
        let dataList = dataClosed.dataList
        
        for data in dataList{
            
            updateData(data:data)
        }
        
        self.title.text = "초단기"
    }
}
