//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 10.12.22.
//

import Foundation

struct Parser {
    static func parse(_ input: String) -> [Command] {
        input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .newlines)
            .compactMap { line in
                if line.hasPrefix("noop") {
                    return .noop
                } else if line.hasPrefix("addx") {
                    let rawAmount = line.components(separatedBy: .whitespaces)[1]
                    guard let amount = Int(rawAmount) else {
                        print(rawAmount, "is not a number")
                        return nil
                    }
                    return .addx(amount)
                }
                return nil
            }
    }
}
