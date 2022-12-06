public class Day5 {
    private(set) var stacks: [Stack]
    private let moves: [Move]
    let parser = Parser()

    required public init(_ input: String) {
        let model = parser.parse(input)
        self.stacks = model.stacks
        self.moves = model.moves
    }

    public var solution1: String {
        applyingMovesWithOldCrane(to: stacks)
            .compactMap {
                $0.crates.last
            }
            .asString
    }

    public var solution2: String {
        applyingMovesWithNewCrane(to: stacks)
            .compactMap {
                $0.crates.last
            }
            .asString
    }

    func applyingMovesWithOldCrane(to stacks: [Stack]) -> [Stack] {
        var tmpStacks = stacks
        for move in moves {
            for _ in 0..<move.amount {
                tmpStacks = movingCrateWithOldCrane(
                    fromStack: move.fromStack,
                    toStack: move.toStack,
                    stacks: tmpStacks
                )
            }
        }
        return tmpStacks
    }

    func movingCrateWithOldCrane(fromStack: Int, toStack: Int, stacks: [Stack]) -> [Stack] {
        var tmpStacks = stacks
        guard let liftedCrate = tmpStacks[fromStack].crates.popLast() else {
            print("Could not lift crate. Stack \(fromStack) is unexpectedly empty.")
            return []
        }
        tmpStacks[toStack].crates.append(liftedCrate)
        return tmpStacks
    }
    
    func applyingMovesWithNewCrane(to stacks: [Stack]) -> [Stack] {
        var tmpStacks = stacks
        for move in moves {
            tmpStacks = applyingMoveWithNewCrane(move, to: tmpStacks)
        }
        return tmpStacks
    }
    
    func applyingMoveWithNewCrane(_ move: Move, to stacks: [Stack]) -> [Stack] {
        var tmpStacks = stacks
        let liftedCrates = Array(tmpStacks[move.fromStack].crates.suffix(move.amount))
        tmpStacks[move.fromStack].crates = tmpStacks[move.fromStack].crates.dropLast(move.amount)
        tmpStacks[move.toStack].crates += liftedCrates
        return tmpStacks
    }
}

private extension Array where Element == Character {
    var asString: String {
        self.map { String($0) }.joined()
    }
}
