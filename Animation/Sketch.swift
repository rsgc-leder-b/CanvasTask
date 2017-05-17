//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch : NSObject {

    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : EnhancedCanvas
    
    let tree : LindenmayerSystem
    var treeArray : [VisualizedLindenmayerSystem]

    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        tree = LindenmayerSystem(angle: 22,
                                 axiom: "F",
                                 generations: 5,
                                 rules: ["F" : ["1FF-[2-F+F+F]+[3+F-F-F]","1FF+[2+F-F-F]-[3-F+F+F]"]])
        treeArray = []

        for _ in 0 ... 20 {
            treeArray.append(VisualizedLindenmayerSystem(with: tree,
                                                         length: Float(random(from: 30, toButNotIncluding: 50)),
                                                         reduction: 2,
                                                         x: Float(random(from: 25, toButNotIncluding: 475)),
                                                         y: Float(random(from: 0, toButNotIncluding: 400)),
                                                         direction: 90,
                                                         colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 50, b: 20),
                                                                  "2" : LindenmayerSystem.Colour(h: 100, s: 100, b: 85),
                                                                  "3" : LindenmayerSystem.Colour(h: 120, s: 95, b: 90)]))
        }
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 100
        canvas.fillColor = Color(hue: 10, saturation: 62, brightness: 26, alpha: 100)
        canvas.drawRectangle(centreX: canvas.width/2, centreY: 175, width: canvas.width, height: 350)
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimated(systems: treeArray, generations: [3])
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
