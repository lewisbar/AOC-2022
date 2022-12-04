//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 03.12.22.
//

import Foundation

struct Parser {
    func parse(_ input: String) -> [ElfPair] {
        input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .newlines)
            .map { line in
                let rawElves = line.components(separatedBy: ",")
                let twoElves = rawElves.map { rawElf in
                    let bounds = rawElf
                        .components(separatedBy: "-")
                        .compactMap { Int($0) }
                    return Elf(firstSection: bounds[0], lastSection: bounds[1])
                }
                return ElfPair(elf1: twoElves[0], elf2: twoElves[1])
            }
    }
}
