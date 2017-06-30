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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func updateData(data:WeatherData){
        
        let newView = UIView()
        newView.backgroundColor = UIColor.green
        newView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(newView)
        
        NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
    }
    
    
    
    func cleanAll(){
        
        let views = self.stackView.arrangedSubviews
        
        for view in views{
            self.stackView.removeArrangedSubview(view)
        }

    }
    
    
    func update(dataClosed:WeatherDataClosed){
        
        cleanAll()
        
        
        let dataList = dataClosed.dataList
        
        for data in dataList{
            
            updateData(data:data)
        }
    }
}
