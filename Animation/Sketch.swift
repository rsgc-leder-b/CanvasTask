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
    
    // Create the basic L-systems
    let kochSnowflake : LindenmayerSystem
    
    // Create the visualizations of the snowflake
    let smallKochSnowflake : VisualizedLindenmayerSystem
    let mediumKochSnowflake : VisualizedLindenmayerSystem
    
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
       // random(from: 50, toButNotIncluding: 200)
        for _ in 0 ... 20 {
            treeArray.append(VisualizedLindenmayerSystem(with: tree,
                                                         length: Float(random(from: 20, toButNotIncluding: 40)),
                                                         reduction: 2,
                                                         x: Float(random(from: 25, toButNotIncluding: 475)),
                                                         y: Float(random(from: 0, toButNotIncluding: 400)),
                                                         direction: 90,
                                                         colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 50, b: 20),
                                                                  "2" : LindenmayerSystem.Colour(h: 110, s: 100, b: 85),
                                                                  "3" : LindenmayerSystem.Colour(h: 120, s: 95, b: 90)]))
        }
        
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 60,
                                          axiom: "F++F++F",
                                          generations: 3,
                                          rules: ["F" : ["1F-2F++3F-4F"]])

        // Visualize this as a small snowflake
        smallKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                         length: 90,
                                                         reduction: 3,
                                                         x: 120,
                                                         y: 175,
                                                         direction: 0,
                                                         colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 100, b: 100),
                                                                  "2" : LindenmayerSystem.Colour(h: 110, s: 100, b: 100),
                                                                  "3" : LindenmayerSystem.Colour(h: 170, s: 100, b: 100),
                                                                  "4" : LindenmayerSystem.Colour(h: 230, s: 100, b: 100)])
        
        // Visualize this as a small snowflake
        mediumKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                          length: 270,
                                                          reduction: 3,
                                                          x: 150,
                                                          y: 200,
                                                          direction: 0,
                                                          colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 100, b: 100),
                                                                   "2" : LindenmayerSystem.Colour(h: 110, s: 100, b: 100),
                                                                   "3" : LindenmayerSystem.Colour(h: 170, s: 100, b: 100),
                                                                   "4" : LindenmayerSystem.Colour(h: 230, s: 100, b: 100)])
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 100
        
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
