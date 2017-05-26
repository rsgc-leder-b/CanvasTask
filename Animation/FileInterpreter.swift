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
            if (lineComponents[0] == "]")
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
        
    }
}
