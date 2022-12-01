//
//  File.swift
//  
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation

struct Parser {
    func parse(_ input: String) -> [Elf] {
        var elves = [Elf]()

        let rawElves = input.components(separatedBy: "\n\n")
        for rawElf in rawElves {
            let items = rawElf
                .components(separatedBy: .newlines)
                .map {
                    guard let value = Int($0) else { print("\($0) could not be converted to Int."); return 0 }
                    return value
                }

            elves.append(Elf(foodItems: items))
        }

        return elves
    }
}
