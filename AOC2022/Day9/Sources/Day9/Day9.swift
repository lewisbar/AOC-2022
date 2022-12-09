public class Day9 {
    let parser = Parser()
    let mover = Mover()
    let moves: [Move]

    required public init(_ input: String) {
        moves = parser.parse(input)
    }

    public var solution1: String {
        mover.numberOfDifferentPositionsTouchedByTail(after: moves).asString
    }

    public var solution2: String {
        "?"
    }
}

private extension Int {
    var asString: String {
        String(self)
    }
}
