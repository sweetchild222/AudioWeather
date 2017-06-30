//
//  TableViewCellLocation.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 6..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellLocation: UITableViewCell {

    @IBOutlet weak var location: UILabel!

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

    }
    
    
    public func updateLocation(address:Address){
        
        self.location.text = address.getText()
    }
}
