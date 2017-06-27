//
//  TableViewCellWeek.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 3..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellWeek: UITableViewCell {

    @IBOutlet var buttons: [ButtonCheck]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateDisableAll(){
        
        for button in buttons{
            
            button.isChecked = false
        }
        
    }
    
    func updateChecked(checked:[Bool]){
        
        for index in 0..<checked.count{
            
            buttons[index].isChecked = checked[index]
        }
    }
}
