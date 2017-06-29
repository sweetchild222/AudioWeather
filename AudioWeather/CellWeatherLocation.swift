//
//  CellWeatherLocation.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 29..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellWeatherLocation: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func updateLocation(address:Address){
        
        if address.getText() == AddressMap.instance.current{
            
            self.location.text = "현재 위치"
        }
        
        self.location.text = address.getText()
    }
}
