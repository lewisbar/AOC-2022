//
//  ContentViewModel.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation
import Day1

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

class ContentViewModel {
    var solutions: [Solution] {[
        day1
    ]}

    private var day1: Solution = {
        let id = "Day 1"

        guard let url = Bundle.main.url(forResource: "InputDay1", withExtension: "txt") else {
            print("File not found.")
            return Solution(id)
        }
        guard let input = try? String(contentsOf: url) else {
            print("Contents of URL could not be converted to String.")
            return Solution(id)
        }

        let day1 = Day1(input)
        return Solution(id, part1: day1.solution1, part2: day1.solution2)
    }()
}
