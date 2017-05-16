import Foundation

public class EnhancedCanvas : Canvas {
	
	public func render(system s : VisualizedLindenmayerSystem) {
		
		render(system: s, generation: s.n)
		
	}
	
	public func render(system : VisualizedLindenmayerSystem, generation : Int) {
		
		// Verify that generation that was asked to be rendered actually exists
		var generation = generation
		if generation > system.n {
			generation = system.n
		}
		
		// Change the line length
		system.currentLength = Float( Double(system.initialLength) / pow(Double(system.reduction), Double(generation)) )
		
		// Render the word
		self.saveState()
		self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
		for c in system.word[generation].characters {
			interpret(character: c, forThis: system)
		}
		self.restoreState()
		
	}
	
	public func renderAnimated(systems : [VisualizedLindenmayerSystem], generations : [Int]) {
		var i = 0
		for system in systems {
			// Verify that generation that was asked to be rendered actually exists
			var generation = generations.count > i ? generations[i] : generations[generations.count-1]
			if generation > system.n {
				generation = system.n
			}
			
			// Things to do at start of L-system animation...
			if system.animationPosition == 0 {
				
				// Change the line length
				system.currentLength = Float( Double(system.initialLength) / pow(Double(system.reduction), Double(generation)) )
				
				// Move turtle to starting point
				//self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
			}
			
			// Don't run past end of the word
			if system.animationPosition < system.word[generation].characters.count {
				
				// Get the index of the next character
				let index = system.word[generation].index(system.word[generation].startIndex, offsetBy: system.animationPosition)
				
				// Get the next character
				let c = system.word[generation][index]
				
				// Render the character
				interpret(character: c, forThis: system)
				
				// Move to next character in word
				system.animationPosition += 1
				
			}
			i += 1
		}
	}
	func interpret(character : Character, forThis system : VisualizedLindenmayerSystem) {
		// Interpret each character of the word
		let newX = Float(CGFloat(system.x)+cos(CGFloat(M_PI)*system.currentAngle/180)*CGFloat(system.currentLength))
		let newY = Float(CGFloat(system.y)+sin(CGFloat(M_PI)*system.currentAngle/180)*CGFloat(system.currentLength))
		// MARK: Switch
		switch character {
		case "+":
			// Turn left
			system.currentAngle += system.angle
		case "-":
			// Turn right
			system.currentAngle -= system.angle
		case "[":
			system.stateList.append(VisualizedLindenmayerSystem.systemState(x: system.x, y: system.y, a: system.currentAngle))
		case "]":
			system.x = system.stateList[system.stateList.count-1].xPos
			system.y = system.stateList[system.stateList.count-1].yPos
			system.currentAngle = system.stateList[system.stateList.count-1].angle
			system.stateList.removeLast()
		default:
			let unicodeValue = String(character).unicodeScalars[String(character).unicodeScalars.startIndex].value
			if unicodeValue > 47 && unicodeValue < 58 {
				if let currColour = system.colorList[String(character)] {
					self.lineColor = Color(hue: currColour.hue, saturation: currColour.saturation, brightness: currColour.brightness, alpha: 100)
				}
			} else if unicodeValue > 64 && unicodeValue < 91 { // Uppercase
				// Go forward while drawing a line
				self.drawLine(fromX: system.x, fromY: system.y, toX: newX, toY: newY)
				system.x = newX
				system.y = newY
			} else if unicodeValue > 96 && unicodeValue < 123 {
				// Go forward without drawing a line
				system.x = newX
				system.y = newY

			}
			break
		}
	}
}
