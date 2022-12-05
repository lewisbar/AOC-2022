//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 04.12.22.
//

import Foundation

struct Day5Model: Equatable {
    var stacks: [Stack]
    let moves: [Move]
}

struct Stack: Equatable {
    var crates: [Character]
}

struct Move: Equatable {
    let amount: Int
    let fromStack: Int
    let toStack: Int
}

struct Parser {
    func parse(_ input: String, isSampleInput: Bool = false) -> Day5Model {
        let (stackInput, movesInput) = splitFullInput(input)
        let stacks = parseStackInput(stackInput)
        let moves = parseMoveInput(movesInput)

        return Day5Model(stacks: stacks, moves: moves)
    }

    // MARK: - Full Input
    func splitFullInput(_ input: String) -> (String, String) {
        let resultArray = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: "\n\n")
        if resultArray.count != 2 {
            print("Invalid amount of double line breaks in input: Expected 1, got \(resultArray.count - 1).")
        }
        let stackInput = removeNumbersFromStackInput(resultArray[0])
        return (stackInput, resultArray[1])
    }

    private func removeNumbersFromStackInput(_ input: String) -> String {
        input
            .components(separatedBy: .newlines)
            .dropLast(1)
            .joined(separator: "\n")
    }

    // MARK: - Stack Input
    func parseStackInput(_ input: String) -> [Stack] {
        let lines = input.components(separatedBy: .newlines)
        let parsedLines = lines.reversed().map { parseLine($0) }
        return composeStacks(from: parsedLines)
    }
    
    func composeStacks(from lines: [[Character]]) -> [Stack] {
        let stackCount = lines[0].count
        var stacks = [Stack]()
        
        for stackIndex in 0..<stackCount {
            let crates = lines
                .map { $0[stackIndex] }
                .filter { $0 != " "}
            
            stacks.append(Stack(crates: crates))
        }
        
        return stacks
    }

    func parseLine(_ line: String) -> [Character] {
        let lineArray = Array(line)
        var characters = [Character]()
        var index = 1
        while index < lineArray.count {
            characters.append(lineArray[index])
            index += 4
        }
        return characters
    }

    // MARK: - Moves Input
    func parseMoveInput(_ input: String) -> [Move] {
        let lines = input.components(separatedBy: .newlines)
        return lines.map { line in
            let lineArray = line.components(separatedBy: .whitespaces)
            guard let amount = Int(lineArray[1]),
                  let fromStack = Int(lineArray[3]),
                  let toStack = Int(lineArray[5]) else {
                print("Could not parse moves.")
                return Move(amount: 0, fromStack: 0, toStack: 0)
            }
            return Move(amount: amount, fromStack: fromStack - 1, toStack: toStack - 1)
        }
    }
}
