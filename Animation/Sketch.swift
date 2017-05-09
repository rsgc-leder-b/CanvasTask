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
//    let kochIsland : LindenmayerSystem
//    let kochSwirl : LindenmayerSystem
//    let kochConstruction : LindenmayerSystem
    
    // Create the visualizations of the snowflake
    let smallKochSnowflake : VisualizedLindenmayerSystem
    let mediumKochSnowflake : VisualizedLindenmayerSystem
    
    // Create visualizations of other systems
//    let largeKochIsland : VisualizedLindenmayerSystem
//    let mediumKochSwirl : VisualizedLindenmayerSystem
//    let mediumConstruction : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 60,
                                          axiom: "F++F++F",
                                          generations: 3,
                                          rules: ["F" : "1F-2F++3F-4F"])
        
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
        
        /*
        // Set up a Koch Island
        kochIsland = LindenmayerSystem(angle: 90,
                                       axiom: "F-F-F-F",
                                       rule: "F-F+F+FF-F-F+F",
                                       generations: 5,
                                       colors: ["1" : LindenmayerSystem.Colour(h: 100, s: 100, b: 100),
                                                "2" : LindenmayerSystem.Colour(h: 50, s: 100, b: 100)],
                                       rules: ["F" : "F-F+F+FF-F-F+F"])
        
        // Visualize the Koch Island
        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland,
                                                       length: 300,
                                                       reduction: 4,
                                                       x: 100,
                                                       y: 400,
                                                       direction: 10)
        
        // Set up a Koch Swirl
        kochSwirl = LindenmayerSystem(angle: 90,
                                      axiom: "-F",
                                      rule: "F+F-F-F+F",
                                      generations: 4,
                                      colors: ["1" : LindenmayerSystem.Colour(h: 100, s: 100, b: 100),
                                               "2" : LindenmayerSystem.Colour(h: 50, s: 100, b: 100)],
                                      rules: ["F" : "F+F-F-F+F"])
        
        // Visualize the Koch Swirl
        mediumKochSwirl = VisualizedLindenmayerSystem(with: kochSwirl,
                                                      length: 300,
                                                      reduction: 3,
                                                      x: 250,
                                                      y: 400,
                                                      direction: 0)

        // Set up another Koch construction
        kochConstruction = LindenmayerSystem(angle: 90,
                                             axiom: "F-F-F-F",
                                             rule: "FF-F-F-F-F-F+F",
                                             generations: 3,
                                             colors: ["1" : LindenmayerSystem.Colour(h: 100, s: 100, b: 100),
                                                      "2" : LindenmayerSystem.Colour(h: 50, s: 100, b: 100)],
                                             rules: ["F" : "FF-F-F-F-F-F+F"])
        
        // Visualize this other Koch construction
        mediumConstruction = VisualizedLindenmayerSystem(with: kochConstruction,
                                                         length: 200,
                                                         reduction: 4,
                                                         x: 250,
                                                         y: 350,
                                                         direction: 0)
        */
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimated(system: mediumKochSnowflake, generation: 2)
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
