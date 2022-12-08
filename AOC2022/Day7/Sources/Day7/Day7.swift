public class Day7 {
    private let store = Store()
    private let parser = Parser()

    required public init(_ input: String) {
        parser.parse(input, to: store)
    }

    public var solution1: String {
        String(store.totalSize)
    }

    public var solution2: String {
        "?"
    }
}
