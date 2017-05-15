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
    let showTree3 : VisualizedLindenmayerSystem
    let showTree2 : VisualizedLindenmayerSystem
    let showTree1 : VisualizedLindenmayerSystem

    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        tree = LindenmayerSystem(angle: 22,
                                 axiom: "F",
                                 generations: 5,
                                 rules: ["F" : ["1FF-[2-F+F+F]+[3+F-F-F]"]])
        
        showTree1 = VisualizedLindenmayerSystem(with: tree,
                                               length: 100,
                                               reduction: 2,
                                               x: 150,
                                               y: 50,
                                               direction: 90,
                                               colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 50, b: 20),
                                                        "2" : LindenmayerSystem.Colour(h: 110, s: 100, b: 85),
                                                        "3" : LindenmayerSystem.Colour(h: 120, s: 95, b: 90)])
        showTree2 = VisualizedLindenmayerSystem(with: tree,
                                                length: 70,
                                                reduction: 2,
                                                x: 50,
                                                y: 70,
                                                direction: 90,
                                                colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 50, b: 20),
                                                         "2" : LindenmayerSystem.Colour(h: 110, s: 100, b: 85),
                                                         "3" : LindenmayerSystem.Colour(h: 120, s: 95, b: 90)])
        showTree3 = VisualizedLindenmayerSystem(with: tree,
                                                length: 75,
                                                reduction: 2,
                                                x: 300,
                                                y: 25,
                                                direction: 90,
                                                colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 50, b: 20),
                                                         "2" : LindenmayerSystem.Colour(h: 110, s: 100, b: 85),
                                                         "3" : LindenmayerSystem.Colour(h: 120, s: 95, b: 90)])
        
        
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
        canvas.framesPerSecond = 300
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        //canvas.saveState()
        
        // Render the current system
        canvas.renderAnimated(systems: [showTree1, showTree2, showTree3], generations: [4, 4, 4])
        
        //canvas.restoreState()
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
