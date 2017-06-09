//
//  TableViewCellRepeat.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 4..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class TableViewCellRepeat: UITableViewCell {

    @IBOutlet var buttons: [ButtonRepeat]!
    
    
    func updateCheckState(sender: Any){
        
        for button in buttons{
            
            if button == (sender as! ButtonRepeat) {
                
                button.isChecked = true
            }
            else{
                
                button.isChecked = false
            }
        }
    }
    
    @IBAction func touchedRepeat(_ sender: Any) {
        updateCheckState(sender:sender)
    }
}
