import Foundation

public class Day2 {
    var rounds1 = [Round]()
    var rounds2 = [Round]()
    let parser = Parser()

    required public init(_ input: String) {
        self.rounds1 = parser.parse1(input)
        self.rounds2 = parser.parse2(input)
    }
    
    public var solution1: String {
        rounds1
            .map { $0.score }
            .reduce(0, +)
            .asString
    }

    public var solution2: String {
        rounds2
            .map { $0.score }
            .reduce(0, +)
            .asString
    }
}

private extension Int {
    var asString: String {
        String(self)
    }
}
