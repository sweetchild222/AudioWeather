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
        
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        //newView.translatesAutoresizingMaskIntoConstraints = false
        newView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(newView)
        
        //NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        
        //self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
    }
    
    
    func cleanAll(){
        
        let views = self.stackView.arrangedSubviews
        
        for view in views{
            self.stackView.removeArrangedSubview(view)
        }
        
    }
    
    
    func update(dataSpace:WeatherDataSpace){
        
        print("cell space")
        
        cleanAll()
        
        let dataList = dataSpace.dataList
        
        for data in dataList{
            
            updateData(data:data)
        }
    }

}
