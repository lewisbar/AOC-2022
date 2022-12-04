public class Day4 {
    private var elfPairs: [ElfPair]
    let parser = Parser()

    required public init(_ input: String) {
        self.elfPairs = parser.parse(input)
    }

    public var solution1: String {
        elfPairs.filter { $0.isRedundant }.count.asString
    }

    public var solution2: String {
        elfPairs.filter { $0.isOverlapping }.count.asString
    }
}

private extension Int {
    var asString: String {
        String(self)
    }
}
