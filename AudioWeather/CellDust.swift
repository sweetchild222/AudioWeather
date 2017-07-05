//
//  CellDust.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 30..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellDust: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func update(address:Address?, dustList:[String: [String: DustRequester.Grade]]) {
        
        guard let xAddress = address else{
            
            return
        }
        
        
        
        
        
        
        print("update dust\(xAddress.getText())")
        
    }
    
}
