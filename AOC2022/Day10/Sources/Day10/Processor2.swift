//
//  Processor2.swift
//  
//
//  Created by LennartWisbar on 10.12.22.
//

import Foundation

class Processor2 {
    private let commands: [Command]
    private var cycle = 1
    private var spriteMiddlePosition = 2
    private var nextLinebreak = 40
    private var currentImage = "\n"

    private var spritePositions: [Int] {[
        spriteMiddlePosition-1,
        spriteMiddlePosition,
        spriteMiddlePosition+1
    ]}

    init(commands: [Command]) {
        self.commands = commands
    }

    var image: String {
        for command in commands {
            guard nextLinebreak < 241 else { break }

            switch command {
            case .noop:
                updateValues()

            case .addx(let amount):
                updateValues()
                updateValues()
                spriteMiddlePosition += amount
            }
        }

        return currentImage
    }

    private func updateValues() {
        if spritePositions.contains(cycle) {
            currentImage += "#"
        } else {
            currentImage += " "
        }

        if cycle == nextLinebreak {
            currentImage += "\n"
            nextLinebreak += 40
            spriteMiddlePosition += 40
        }

        cycle += 1
    }
}
