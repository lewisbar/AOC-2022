import Foundation

public class Day3 {
    var rucksacks = [Rucksack]()
    let parser = Parser()

    required public init(_ input: String) {
        self.rucksacks = parser.parse(input)
    }
    
    public var solution1: String {
        rucksacks
            .compactMap { $0.commonItem }
            .reduce(0, +)
            .asString
    }

    public var solution2: String {
        var badges = [Int]()
        var index = 0

        while index < rucksacks.count-2 {
            let rucksack1Items = rucksacks[index].allItems
            let rucksack2Items = rucksacks[index+1].allItems
            let rucksack3Items = rucksacks[index+2].allItems
            for item in rucksack1Items {
                if rucksack2Items.contains(item) && rucksack3Items.contains(item) {
                    badges.append(item)
                    break
                }
            }
            index += 3
        }

        return badges.reduce(0, +).asString
    }
}

private extension Int {
    var asString: String {
        String(self)
    }
}
