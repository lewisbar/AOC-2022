public class Day10 {
    private var commands: [Command]

    required public init(_ input: String) {
        self.commands = Parser.parse(input)
    }

    public var solution1: String {
        Processor.overallSignalStrength(for: commands).asString
    }

    public var solution2: String {
        "?"
    }
}

extension Int {
    var asString: String {
        String(self)
    }
}
