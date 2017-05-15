//
//  VisualizedLindenmayerSystem.swift
//  Canvas
//
//  Created by Russell Gordon on 5/3/17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class VisualizedLindenmayerSystem : LindenmayerSystem {
    
    public struct systemState {
        var xPos : Float
        var yPos : Float
        var angle : Degrees
        init(x : Float, y : Float, a : Degrees) {
            xPos = x
            yPos = y
            angle = a
        }
    }
    
    var initialLength : Float               // initial line segment length
    var reduction : Float                   // reduction factor
    var x : Float                           // initial horizontal position of turtle
    var y : Float                           // initial vertical position of turtle
    var direction : Int                     // initial direction turtle faces (degrees)
    var currentLength : Float               // current line segment length
    var animationPosition = 0               // tracks current character being interpreted when system is animated
    var currentAngle : Degrees
    var colorList : [String : LindenmayerSystem.Colour]
    var stateList = [systemState]()
    
    public init(with providedSystem: LindenmayerSystem,
                length: Float,
                reduction: Float,
                x: Float,
                y: Float,
                direction: Int,
                colors: [String: Colour]) {
        
        // Initialize stored properties
        self.initialLength = length
        self.reduction = reduction
        self.x = x
        self.y = y
        self.direction = direction
        self.currentLength = self.initialLength
        self.colorList = colors
        self.currentAngle = Degrees(direction)
        super.init(with: providedSystem)
    }
    

}
