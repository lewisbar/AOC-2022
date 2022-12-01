import Foundation

public struct Elf: Equatable {
    let foodItems: [Int]
    var totalCalories: Int {
        foodItems.reduce(0, +)
    }
}

public class Day1 {
    var elves = [Elf]()
    let parser = Parser()

    var elfWithMostCalories: Elf {
        elves.sorted(by: { $0.totalCalories > $1.totalCalories })[0]
    }
    var topThreeElves: [Elf] {
        Array(elves.sorted(by: { $0.totalCalories > $1.totalCalories })[..<3])
    }
    public var solution1: String {
        let result = String(elfWithMostCalories.totalCalories)
        print("Day 1-1:", result)
        return result
    }
    public var solution2: String {
        let calories = topThreeElves.map { $0.totalCalories }
        let result = String(calories.reduce(0, +))
        print("Day 1-2", result)
        return result
    }

    public init(_ input: String) {
        self.elves = parser.parse(input)
    }
}
