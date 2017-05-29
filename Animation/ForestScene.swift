//
//  ForestScene.swift
//  Canvas
//
//  Created by Brendan Leder on 2017-05-17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

class ForestScene {
	init() {
	}
	func generateForest() -> [VisualizedLindenmayerSystem] {
		var tree0 : LindenmayerSystem
		var tree1 : LindenmayerSystem
		var shrub : LindenmayerSystem
		var flowr : LindenmayerSystem
		var forest : [VisualizedLindenmayerSystem] = []
		tree0 = LindenmayerSystem(angle: 22,
		                          axiom: "F",
		                          generations: 4,
		                          rules: ["F" : ["1FF-[2-F+F+F]+[3+F-F-F]","1FF-[2-F+F+F]+[3+F-F-F]","1FF+[2+F-F-F]-[3-F+F+F]"]])
		tree1 = LindenmayerSystem(angle: 25,
		                          axiom: "FX",
		                          generations: 5,
		                          rules: ["F" : ["0FF-[1-F+F]+[2+F-F]"], "X" : ["0FF+[1+F]+[3-F]"]])
		shrub = LindenmayerSystem(angle: 25,
		                          axiom: "X",
		                          generations: 3,
		                          rules: ["F" : ["FF"], "X" : ["0F-[2[X]+3X]+1F[3+FX]-X"]])
		flowr = LindenmayerSystem(angle: 25,
		                          axiom: "F",
		                          generations: 5,
		                          rules: ["F" : ["0F[+F]F[-F]1F"]])
		let xPosition : [Float] = [90, 250, 400, 30, 130, 380, 310, 20, 50, 126, 216, 125, 50, 370, 420, 70, 280, 345, 300]
		let yPosition : [Float] = [126, 216, 125, 50, 20, 220, 70, 280, 245, 300, 90, 250, 330, 30, 130, 250, 160, 20, 50]
		for i in 0 ... 3 {
			forest.append(VisualizedLindenmayerSystem(with: tree0,
			                                          thickness: 1,
			                                          tReduction: 1,
			                                          length: Float(random(from: 50, toButNotIncluding: 60)),
			                                          reduction: 2,
			                                          x: xPosition[i],
			                                          y: yPosition[i],
			                                          direction: 90,
			                                          colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 50, b: 20),
			                                                   "2" : LindenmayerSystem.Colour(h: 100, s: 100, b: 85),
			                                                   "3" : LindenmayerSystem.Colour(h: 120, s: 95, b: 90)]))
		}
		for i in 4 ... 6 {
			forest.append(VisualizedLindenmayerSystem(with: tree1,
			                                          thickness: 3,
			                                          tReduction: 1,
			                                          length: Float(random(from: 50, toButNotIncluding: 70)),
			                                          reduction: 2,
			                                          x: xPosition[i],
			                                          y: yPosition[i],
			                                          direction: 90,
			                                          colors: ["0" : LindenmayerSystem.Colour(h: 31, s: 96, b: 36),
			                                                   "1" : LindenmayerSystem.Colour(h: 75, s: 96, b: 44),
			                                                   "2" : LindenmayerSystem.Colour(h: 90, s: 100, b: 40),
			                                                   "3" : LindenmayerSystem.Colour(h: 105, s: 100, b: 60)]))
		}
		for i in 7 ... 10 {
			forest.append(VisualizedLindenmayerSystem(with: flowr,
			                                          thickness: 2,
			                                          tReduction: 1,
			                                          length: Float(random(from: 50, toButNotIncluding: 100)),
			                                          reduction: 3,
			                                          x: xPosition[i],
			                                          y: Float(random(from: 0, toButNotIncluding: 350)),
			                                          direction: 90,
			                                          colors: ["0" : LindenmayerSystem.Colour(h: 90, s: 100, b: 40),
			                                                   "1" : LindenmayerSystem.Colour(h: 200, s: 100, b: 100)]))
		}
		for i in 11 ... 18 {
			forest.append(VisualizedLindenmayerSystem(with: shrub,
			                                          thickness: 1,
			                                          tReduction: 1,
			                                          length: Float(random(from: 10, toButNotIncluding: 30)),
			                                          reduction: 2,
			                                          x: xPosition[i],
			                                          y: yPosition[i],
			                                          direction: 90,
			                                          colors: ["0" : LindenmayerSystem.Colour(h: 31, s: 96, b: 36),
			                                                   "1" : LindenmayerSystem.Colour(h: 65, s: 96, b: 44),
			                                                   "2" : LindenmayerSystem.Colour(h: 80, s: 100, b: 40),
			                                                   "3" : LindenmayerSystem.Colour(h: 75, s: 100, b: 60)]))
		}
		return forest
	}
}
