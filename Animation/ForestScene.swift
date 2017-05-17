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
        var tree : LindenmayerSystem
        var forest : [VisualizedLindenmayerSystem] = []
        tree = LindenmayerSystem(angle: 22,
                                 axiom: "F",
                                 generations: 5,
                                 rules: ["F" : ["1FF-[2-F+F+F]+[3+F-F-F]","1FF+[2+F-F-F]-[3-F+F+F]"]])
        for _ in 0 ... 10 {
            forest.append(VisualizedLindenmayerSystem(with: tree,
                                                      length: Float(random(from: 30, toButNotIncluding: 50)),
                                                      reduction: 2,
                                                      x: Float(random(from: 25, toButNotIncluding: 475)),
                                                      y: Float(random(from: 0, toButNotIncluding: 300)),
                                                      direction: 90,
                                                      colors: ["1" : LindenmayerSystem.Colour(h: 50, s: 50, b: 20),
                                                               "2" : LindenmayerSystem.Colour(h: 100, s: 100, b: 85),
                                                               "3" : LindenmayerSystem.Colour(h: 120, s: 95, b: 90)]))
        }
        return forest
    }
}
