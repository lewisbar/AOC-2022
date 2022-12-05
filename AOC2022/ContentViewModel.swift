//
//  ContentViewModel.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation

protocol FileReaderType {
    func read(_ filename: String, fileExtension: String) -> String
}

struct ContentViewModel {
    private let reader: FileReaderType

    var solutions: [Solution] {
        allDays(types: DayConstants.dayTypes)
    }

    init(reader: FileReaderType = FileReader.shared) {
        self.reader = reader
    }

    private func allDays(types: [DayType.Type]) -> [Solution] {
        var solutions = [Solution]()

        for i in 1...types.count {
            let id = "Day \(i)"
            let filename = "InputDay\(i)"
            let input = reader.read(filename, fileExtension: "txt")
            let day = types[i-1].init(input)
            solutions.append(
                Solution(
                    id,
                    part1: day.solution1,
                    part2: day.solution2
                )
            )
        }
        
        print(solutionsDescription(for: solutions))

        return solutions
    }
    
    private func solutionsDescription(for solutions: [Solution]) -> String {
        var output = ""
        for solution in solutions {
            output += "\(solution.id): \(solution.part1), \(solution.part2)\n"
        }
        return output
    }
}
