//
//  CellSpace.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 30..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellSpace: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
    
    
    func updateLabel(){
        
        let label = UILabel()
        label.textAlignment = NSTextAlignment.left
        label.text = "단기"
        label.textColor = UIColor.darkGray
        label.font = label.font.withSize(15)
        self.stackView.addArrangedSubview(label)
    }
    
    
    func cleanAll(){
        
        let views = self.stackView.arrangedSubviews
        
        for view in views{
            
            let dataView = view as! CellWeatherData
            
            dataView.clean()
            
            self.stackView.removeArrangedSubview(dataView)
        }
    }
    
    
    func update(dataSpace:WeatherDataSpace){
        
        cleanAll()
        
        let dataList = dataSpace.dataList
        
        if dataList.count == 0{
            
            self.isHidden = true
        }
        else{
            
        
            self.isHidden = false
            
            updateLabel()
        
            for data in dataList{
                
                updateData(data:data)
            }
        }
    }

}
