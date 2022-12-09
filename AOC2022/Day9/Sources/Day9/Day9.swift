public class Day9 {
    let parser = Parser()
    let moves: [Move]

    required public init(_ input: String) {
        moves = parser.parse(input)
    }

    public var solution1: String {
        Rope(knotCount: 2)
            .numberOfDifferentPositionsTouchedByTail(after: moves)
            .asString
    }

    public var solution2: String {
        Rope(knotCount: 10)
            .numberOfDifferentPositionsTouchedByTail(after: moves)
            .asString
    }
}

private extension Int {
    var asString: String {
        String(self)
    }
}
