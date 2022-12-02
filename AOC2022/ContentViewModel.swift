//
//  ContentViewModel.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation
import Day1
import Day2

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

struct ContentViewModel {
    var solutions: [Solution] {[
        day1(),
        day2()
    ]}

    private var reader: FileReader

    init(reader: FileReader = FileReader.shared) {
        self.reader = reader
    }

    private func day1() -> Solution {
        let id = "Day 1"
        let filename = "InputDay1"

        let input = reader.read(filename)
        let day1 = Day1(input)

        return Solution(id, part1: day1.solution1, part2: day1.solution2)
    }

    private func day2() -> Solution {
        let id = "Day 2"
        let filename = "InputDay2"

        let input = reader.read(filename)
        let day2 = Day2(input)

        return Solution(id, part1: day2.solution1, part2: day2.solution2)
    }
}
