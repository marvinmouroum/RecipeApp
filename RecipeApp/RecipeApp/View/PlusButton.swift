//
//  PlusButton.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import UIKit

class PlusButton: UIButton {

    
    // draw the cross in the button
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath()
        path.lineWidth = 1
        path.lineCapStyle = .round
        path.move(to: CGPoint(x: rect.width/2, y: 0))
        path.addLine(to: CGPoint(x: rect.width/2, y: rect.height))
        path.move(to: CGPoint(x: 0, y: rect.height/2))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height/2))
        strokeColor.setStroke()
        path.stroke()
        
    }
    
    var strokeColor = UIColor.label
    

}
