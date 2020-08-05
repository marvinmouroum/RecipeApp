//
//  AddButton.swift
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
class AddButton: UIButton {

    
    // draw the cross in the button
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        var diameter = min(rect.size.width,rect.size.height)
        
        if diameter > self.maxDiameter{
            diameter = maxDiameter
        }
        
        let dh = (rect.height - diameter)/2
        let dw = (rect.width  - diameter)/2
        
        let bound = UIBezierPath(arcCenter: CGPoint(x: rect.width/2, y: rect.height/2), radius: diameter/2, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        bound.lineWidth = 1
        fillColor.setFill()
        bound.fill()
        strokeColor.setStroke()
        bound.stroke()
        
        
        let path = UIBezierPath()
        path.lineWidth = 1
        path.lineCapStyle = .round
        path.move(to: CGPoint(x: rect.width/2, y: dh+inset))
        path.addLine(to: CGPoint(x: rect.width/2, y: rect.height-dh-inset))
        path.move(to: CGPoint(x: dw+inset, y: rect.height/2))
        path.addLine(to: CGPoint(x: rect.width-dw-inset, y: rect.height/2))
        strokeColor.setStroke()
        path.stroke()
        
        let border = UIBezierPath(roundedRect: rect, cornerRadius: 5)
        UIColor.systemGray.setStroke()
        border.stroke()
        
    }
    
    var strokeColor = UIColor.label
    var fillColor   = UIColor.systemBackground
    
    ///inset for the stroke of the cross,
    ///a value of 0 would stretch them acrosss their rect
    var inset:CGFloat = 5
    
    ///maximum diameter of the imaginary border, the actually button dimensions can have  a different rect size
    var maxDiameter:CGFloat = 50
    

}
