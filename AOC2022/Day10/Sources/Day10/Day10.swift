public class Day10 {
    private let commands: [Command]

    required public init(_ input: String) {
        self.commands = Parser.parse(input)
    }

    public var solution1: String {
        let processor = Processor1(commands: commands)
        return processor.overallSignalStrength.asString
    }

    public var solution2: String {
        let processor = Processor2(commands: commands)
        return processor.image
    }
}

extension Int {
    var asString: String {
        String(self)
    }
}
