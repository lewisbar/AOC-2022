//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 09.12.22.
//

import Foundation

class Parser {
    func parse(_ input: String) -> [Move] {
        var moves = [Move]()
        let lines = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .newlines)

        for line in lines {
            let components = line.components(separatedBy: .whitespaces)

            guard let move = Move(components[0]) else {
                print("\(components[0]) is no valid direction.)")
                return []
            }
            guard let amount = Int(components[1]) else {
                print("\(components[1]) is not a number.")
                return []
            }

            for _ in 0..<amount {
                moves.append(move)
            }
        }

        return moves
    }
}

extension Move {
    init?(_ char: String) {
        switch char {
        case "R": self = .east
        case "L": self = .west
        case "U": self = .north
        case "D": self = .south
        default: return nil
        }
    }
}
