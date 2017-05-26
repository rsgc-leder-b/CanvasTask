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
	
	var run = true
	
	let forestGenerator : ForestScene
	let forest : [VisualizedLindenmayerSystem]
	
	// This runs once, equivalent to setup() in Processing
	override init() {
	
		forestGenerator = ForestScene()
		
		// Create a new canvas
		canvas = EnhancedCanvas(width: 500, height: 500)
		
		// The frame rate can be adjusted; the default is 60 fps
		canvas.framesPerSecond = 100
		canvas.fillColor = Color(hue: 240, saturation: 30, brightness: 90, alpha: 100)
		canvas.drawRectangle(centreX: canvas.width/2, centreY: canvas.height/2, width: canvas.width, height: canvas.width)
		canvas.fillColor = Color(hue: 10, saturation: 62, brightness: 46, alpha: 100)
		canvas.drawRectangle(centreX: canvas.width/2, centreY: 175, width: canvas.width, height: 350)
		forest = forestGenerator.generateForest()
	}
	
	// Runs repeatedly, equivalent to draw() in Processing
	func draw() {
		
		// Render the current system
		if run {
			canvas.render/*Animated*/(systems: forest, generations: 4)
			run = false
		}
		
	}
	
	// Respond to the mouseDown event
	func mouseDown() {
		
		
	}
	
}
