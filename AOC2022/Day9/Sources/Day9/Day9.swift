public class Day9 {
    let parser = Parser()
    let moves: [Move]

    required public init(_ input: String) {
        moves = parser.parse(input)
    }

    public var solution1: String {
        let rope = Rope(knotCount: 2)
        return rope.numberOfDifferentPositionsTouchedByTail(after: moves).asString
    }

    public var solution2: String {
        let rope = Rope(knotCount: 10)
        return rope.numberOfDifferentPositionsTouchedByTail(after: moves).asString
    }
}

private extension Int {
    var asString: String {
        String(self)
    }
}
