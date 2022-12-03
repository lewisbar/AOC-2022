//
//  Solution.swift
//  AOC2022
//
//  Created by LennartWisbar on 03.12.22.
//

import Foundation

struct Solution: Identifiable {
    let id: String
    let part1: String
    let part2: String

    init(_ id: String, part1: String = "?", part2: String = "?") {
        self.id = id
        self.part1 = part1
        self.part2 = part2
    }
}
