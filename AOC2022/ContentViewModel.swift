//
//  ContentViewModel.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation
import Day1
import Day2
import Day3
import Day4

struct ContentViewModel {
    private let reader: FileReader

    var solutions: [Solution] {
        allDays(types: [
            Day1.self,
            Day2.self,
            Day3.self,
            Day4.self
        ])
    }

    init(reader: FileReader = FileReader.shared) {
        self.reader = reader
    }

    private func allDays(types: [Day.Type]) -> [Solution] {
        var solutions = [Solution]()

        for i in 1...types.count {
            let id = "Day \(i)"
            let filename = "InputDay\(i)"
            let input = reader.read(filename)
            let day = types[i-1].init(input)
            solutions.append(
                Solution(
                    id,
                    part1: day.solution1,
                    part2: day.solution2
                )
            )
        }

        return solutions
    }
}
