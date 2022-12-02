import Foundation

public class Day1 {
    var elves = [Elf]()
    let parser = Parser()

    public init(_ input: String) {
        self.elves = parser.parse(input)
    }

    var elfWithMostCalories: Elf {
        elves.sorted().reversed()[0]
    }

    var topThreeElves: [Elf] {
        elves.sorted().suffix(3).reversed()
    }

    public var solution1: String {
        String(elfWithMostCalories.totalCalories)
    }

    public var solution2: String {
        let calories = topThreeElves.map { $0.totalCalories }
        return String(calories.reduce(0, +))
    }
}
