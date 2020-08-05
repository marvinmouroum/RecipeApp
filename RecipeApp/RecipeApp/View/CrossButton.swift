//
//  CrossButton.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import UIKit

/**
*This button class is a custom drawn button,
*I am drawing this button because it has a custom design
*NOTE: This design is simplified*
*/
class CrossButton: UIButton {

    
    // draw the cross in the button
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath()
        path.lineWidth = 1
        path.lineCapStyle = .round
        path.move(to: CGPoint(x: inset, y: inset))
        path.addLine(to: CGPoint(x: rect.width-inset, y: rect.height-inset))
        path.move(to: CGPoint(x: rect.width-inset, y: inset))
        path.addLine(to: CGPoint(x: inset, y: rect.height-inset))
        strokeColor.setStroke()
        path.stroke()
        
        let border = UIBezierPath(arcCenter: CGPoint(x: rect.width/2, y: rect.height/2),
                                  radius: min(rect.width/2,rect.height/2),
                                  startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        border.lineWidth = 1
        border.stroke()

    }
    
    var strokeColor = UIColor.label
    
    ///inset for the stroke of the cross,
    ///a value of 0 would stretch them acrosss their rect
    var inset:CGFloat = 10
    

}
