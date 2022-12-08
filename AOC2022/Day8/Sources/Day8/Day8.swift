public class Day8 {
    private let parser = Parser()
    private let observer: Observer
    private let forest: Forest


    required public init(_ input: String) {
        let forest = parser.parse(input)
        self.forest = forest
        self.observer = Observer(forest: forest)
    }

    public var solution1: String {
        String(observer.numberOfVisibleTrees)
    }

    public var solution2: String {
        "?"
    }
}
