import Foundation

public class LindenmayerSystem {
	// Set up required information
	var angle : Degrees                 // rotation amount for turtle (degrees)
	var axiom : String
	var n : Int                         // number of times the production rule is applied
	var word : [String] = []            // the word that will be rendered
	// is rendered with an animation, step by step
	var rules : [String : String] = [:]
	var stochastic = false
	
	public struct Colour {
		var hue : Float
		var saturation : Float
		var brightness : Float
		
		public init(h : Float, s : Float, b : Float) {
			hue = h
			saturation = s
			brightness = b
		}
	}
	
	public init(angle : Degrees,
	            axiom : String,
	            generations : Int,
	            rules : [String : String]) {
		
		// Initialize stored properties
		self.angle = angle
		self.axiom = axiom
		self.n = generations
		self.rules = rules
		self.word.append(axiom)   // The first word is the axiom
		for rule in rules {
			if rule.value[rule.value.index(rule.value.startIndex, offsetBy: 1)] == "/" {
				stochastic = true
			}
		}
		// Apply the production rule
		applyRules()
		
	}
	
	public init(with system : LindenmayerSystem) {
		
		// Initalize stored properties
		self.angle = system.angle
		self.axiom = system.axiom
		self.n = system.n
		self.rules = system.rules
		self.word.append(axiom)   // The first word is the axiom
//		
//		// Apply the production rule
		applyRules()
	}
	
	func applyRules() {
		
		// See if word needs to be re-written
		if n > 0 {
			
			// Apply the production rule "n" times
			for i in 1...n {
				
				// Create a new word
				var newWord = ""
				
				// Inspect each character of existing word
				for character in word[i - 1].characters {
					if let charRule = rules[String(character)] {
						newWord.append(charRule)
					} else {
						// just copy what's in the existing word to the new word
						newWord.append(character)
					}
					
				}
				
				// Add the re-written word to the system
				word.append(newWord)
				
			}
			
		}
		print("Words:")
		print(word)
	}
	
}
