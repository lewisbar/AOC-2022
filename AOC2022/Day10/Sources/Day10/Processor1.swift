//
//  Processor1.swift
//  
//
//  Created by LennartWisbar on 10.12.22.
//

import Foundation

class Processor1 {
    private let commands: [Command]
    private var cycle = 1
    private var x = 1
    private var nextStop = 20
    private var result = 0

    init(commands: [Command]) {
        self.commands = commands
    }

    var overallSignalStrength: Int {
        for command in commands {
            guard nextStop < 221 else { break }

            switch command {
            case .noop:
                updateValues()

            case .addx(let amount):
                updateValues()
                updateValues()
                x += amount
            }
        }

        return result
    }

    private func updateValues() {
        if cycle == nextStop {
            result += cycle * x
            nextStop += 40
        }
        cycle += 1
    }
}
