//
//  Processor.swift
//  
//
//  Created by LennartWisbar on 10.12.22.
//

import Foundation

enum Command: Equatable {
    case noop
    case addx(Int)
}

class Processor {
    static func overallSignalStrength(for commands: [Command]) -> Int {
        var cycle = 1
        var x = 1
        var nextStop = 20
        var result = 0

        for command in commands {
            guard nextStop < 221 else { break }

            switch command {
            case .noop:
                if cycle == nextStop {
                    result += cycle * x
                    nextStop += 40
                }
                cycle += 1

            case .addx(let amount):
                for _ in 0..<2 {
                    if cycle == nextStop {
                        result += cycle * x
                        nextStop += 40
                    }
                    cycle += 1
                }
                x += amount
            }
        }

        return result
    }
}
