//
//  TableViewCellLocation.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 6..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class TableViewCellLocation: UITableViewCell {

    @IBOutlet weak var location: UILabel!

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

    }
    
    
    public func updateLocation(location:String){
        
        self.location.text = location
    }
}
