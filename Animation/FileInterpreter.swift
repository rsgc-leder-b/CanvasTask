//
//  FileInterpreter.swift
//  Canvas
//
//  Created by Brendan Leder on 2017-05-26.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

class FileInterpreter {
	
	let path : String
	
	init(path: String)
	{
		self.path = path
	}
	
	func interpret() -> [VisualizedLindenmayerSystem] {
		guard let reader = LineReader(path: path) else {
			print("Cannot open input file")
			exit(0); // cannot open file
		}
		
		// Create an empty array of type String
		var components : [String] = []
		var systems: [VisualizedLindenmayerSystem] = []
		// Process each line of the input file
		for (_, line) in reader.enumerated() {
			
			let lineComponents = line.components(separatedBy: " ")
			// Check to see if we have reached the end of a system
			if (lineComponents[0] == "]\n")
			{
				systems.append(createSystem(data: components))
				components = []
			}
			// Build an array of each component from the file
			components.append(line)
		}
		return systems
	}
	
	func createSystem(data : [String]) -> VisualizedLindenmayerSystem {
		var axiom : String = ""
		var rules : [Character : [String]] = [:]
		var generations : Int = 0
		var length : Float = 0					// initial line segment length
		var reduction : Float = 0				// reduction factor
		var x : Float = 0						// initial horizontal position of turtle
		var y : Float = 0						// initial vertical position of turtle
		var direction : Int = 0					// initial direction turtle faces (degrees)
		var thickness : Float = 1
		var angle : Degrees = 0
		var tReduction: Float = 1
		var colorList : [String : LindenmayerSystem.Colour] = [:]
		
		for (index, line) in data.enumerated() {
			var cleanLine = line.components(separatedBy: "\n")[0].components(separatedBy: ":")
			switch cleanLine[0] {
			case "angle":
				angle = Degrees(Int(cleanLine[1])!)
				break
			case "axiom":
				axiom = cleanLine[1]
				break
			case "rules":
				var _index = index + 2
				while data[_index].components(separatedBy: "\n")[0].characters[data[_index].components(separatedBy: "\n")[0].characters.startIndex] != "}" {
					var rule = data[_index].components(separatedBy: "\n")[0].components(separatedBy: "=")
					print(rule)
					print(rule[1].components(separatedBy: "/"))
					if rule[1].components(separatedBy: "/").count == 2 {
						let indexCount = Int(rule[1].components(separatedBy: "/")[0])!
						for _ in 1...indexCount {
							if rules[rule[0].characters[rule[0].characters.startIndex]] == nil {
								rules[rule[0].characters[rule[0].characters.startIndex]] = []
							}
							rules[rule[0].characters[rule[0].characters.startIndex]]?.append(rule[1].components(separatedBy: "/")[1])
						}
					} else {
						rules[rule[0].characters[rule[0].characters.startIndex]] = [rule[1]]
					}
					_index += 1
				}
				break
			case "direction":
				direction = Int(cleanLine[1])!
				break
			case "generations":
				generations = Int(cleanLine[1])!
				break
			case "length":
				length = Float(cleanLine[1])!
				break
			case "length_reduction":
				reduction = Float(cleanLine[1])!
				break
			case "thickness_reduction":
				tReduction = Float(cleanLine[1])!
				break
			case "thickness":
				thickness = Float(cleanLine[1])!
				break
			case "x":
				x = Float(cleanLine[1])!
				break
			case "y":
				y = Float(cleanLine[1])!
				break
			case "colors":
				var _index = index + 2
				while data[_index].components(separatedBy: "\n")[0].characters[data[_index].components(separatedBy: "\n")[0].characters.startIndex] != "}" {
					var color = data[_index].components(separatedBy: "\n")[0].components(separatedBy: "=")
					let temp1 = Float(Int(color[1].components(separatedBy: ",")[0])!)
					let temp2 = Float(Int(color[1].components(separatedBy: ",")[1])!)
					let temp3 = Float(Int(color[1].components(separatedBy: ",")[2])!)
					let tempColor = LindenmayerSystem.Colour(h: temp1, s: temp2, b: temp3)
					let indexChar : String = String(color[0].characters[color[0].characters.startIndex])
					colorList[indexChar]=tempColor
					_index += 1
				}
				break
			default:
				break
			}
		}
		let baseSystem : LindenmayerSystem = LindenmayerSystem(angle: angle, axiom: axiom, generations: generations, rules: rules)
		return VisualizedLindenmayerSystem(with: baseSystem, thickness: thickness, tReduction: tReduction, length: length, reduction: reduction, x: x, y: y, direction: direction, colors: colorList)
	}
}
