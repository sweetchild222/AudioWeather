//
//  UILoadingView.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 29..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation
import UIKit


class LoadingView : UIView{
    
    let width: CGFloat = 120
    let height: CGFloat = 30
    let spinner = UIActivityIndicatorView()
    let label = UILabel()

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    

    init(parentWidth:CGFloat, parentHeight:CGFloat){
        
        let x = (parentWidth / 2) - (width / 2)
        let y = (parentHeight / 2) - (height / 2)
        
        super.init(frame: CGRect(x:x, y:y, width:width, height:height))
    }
    
        
    func start(){
        
        self.label.textColor = UIColor.gray
        self.label.textAlignment = NSTextAlignment.center
        self.label.text = "Loading..."
        self.label.frame = CGRect(x:0, y:0, width:width + 20, height:height)
        
        self.spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.spinner.frame = CGRect(x:0, y:0, width:30, height:height)
        self.spinner.startAnimating()
        
        self.addSubview(self.spinner)
        self.addSubview(self.label)
    }
    

    func stop(){
        
        self.spinner.stopAnimating()
        self.label.isHidden = true
    }
}
