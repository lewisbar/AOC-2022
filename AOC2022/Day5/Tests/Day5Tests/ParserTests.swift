import XCTest
@testable import Day5

final class ParserTests: XCTestCase {
    var parser: Parser!

    override func setUp() {
        parser = Parser()
    }

    override func tearDown() {
        parser = nil
    }

    // MARK: - Parse Full Input
    func test_parser_splitsFullInput() {
        let input =
            "[D]        \n" +
            "[N] [C]    \n" +
            "[Z] [M] [P]\n" +
            """
            1   2   3

            move 1 from 2 to 1
            move 3 from 1 to 3
            move 2 from 2 to 1
            move 1 from 1 to 2
            """
        let result = parser.splitFullInput(input)
        let expectedResult = (
            "[D]        \n" +
            "[N] [C]    \n" +
            "[Z] [M] [P]",
            """
            move 1 from 2 to 1
            move 3 from 1 to 3
            move 2 from 2 to 1
            move 1 from 1 to 2
            """)
        XCTAssertEqual(result.0, expectedResult.0)
        XCTAssertEqual(result.1, expectedResult.1)
    }

    func test_parser_producesModelFromFullInput() {
        let input =
            "[D]        \n" +
            "[N] [C]    \n" +
            "[Z] [M] [P]\n" +
            """
            1   2   3

            move 1 from 2 to 1
            move 3 from 1 to 3
            move 2 from 2 to 1
            move 1 from 1 to 2
            """
        let expectedStacks = [
            Stack(crates: ["Z", "N", "D"]),
            Stack(crates: ["M", "C"]),
            Stack(crates: ["P"])
        ]
        let expectedMoves = [
            Move(amount: 1, fromStack: 1, toStack: 0),
            Move(amount: 3, fromStack: 0, toStack: 2),
            Move(amount: 2, fromStack: 1, toStack: 0),
            Move(amount: 1, fromStack: 0, toStack: 1)
        ]
        let expectedModel = Day5Model(
            stacks: expectedStacks,
            moves: expectedMoves
        )
        let result = parser.parse(input, isSampleInput: true)
        XCTAssertEqual(result, expectedModel)
    }

    // MARK: - Parse Line
    func test_parser_parsesSampleLine() {
        let input = "[Z] [M] [P]"
        let result = parser.parseLine(input)
        XCTAssertEqual(result, ["Z", "M", "P"])
    }

    func test_parser_parsesSampleLine_containingEmptyItems() {
        let input = "[Z]     [P]"
        let result = parser.parseLine(input)
        XCTAssertEqual(result, ["Z", " ", "P"])
    }

    func test_parser_parsesRealLine() {
        let input = "[S] [B] [B] [F] [H] [C] [B] [N] [L]"
        let result = parser.parseLine(input)
        XCTAssertEqual(result, ["S", "B", "B", "F", "H", "C", "B", "N", "L"])
    }

    func test_parser_parsesRealLine_containingEmptyItems() {
        let input = "    [B] [B] [F]     [C] [B]     [L]"
        let result = parser.parseLine(input)
        XCTAssertEqual(result, [" ", "B", "B", "F", " ", "C", "B", " ", "L"])
    }

    // MARK: - Parse Stacks
    func test_parser_parsesSampleStackInput() {
        let input =
            "[D]        \n" +
            "[N] [C]    \n" +
            "[Z] [M] [P]"
        let result = parser.parseStackInput(input)
        let expectedResult = [
            Stack(crates: ["Z", "N", "D"]),
            Stack(crates: ["M", "C"]),
            Stack(crates: ["P"])
        ]
        XCTAssertEqual(result, expectedResult)
    }

    func test_parser_parsesRealStackInput() {
        let input =
        "[D]                     [I]        \n" +
        "[N] [C]         [G]     [H]     [J]\n" +
        "[Z] [M] [P] [A] [B] [C] [D] [E] [F]"
        let result = parser.parseStackInput(input)
        let expectedResult = [
            Stack(crates: ["Z", "N", "D"]),
            Stack(crates: ["M", "C"]),
            Stack(crates: ["P"]),
            Stack(crates: ["A"]),
            Stack(crates: ["B", "G"]),
            Stack(crates: ["C"]),
            Stack(crates: ["D", "H", "I"]),
            Stack(crates: ["E"]),
            Stack(crates: ["F", "J"])
        ]
        XCTAssertEqual(result, expectedResult)
    }

    // MARK: - Parse Moves
    func test_parser_parsesMoveInput() {
        let input = """
            move 1 from 2 to 1
            move 3 from 1 to 3
            move 2 from 2 to 1
            move 11 from 1 to 2
            """
        let expectedResult = [
            Move(amount: 1, fromStack: 1, toStack: 0),
            Move(amount: 3, fromStack: 0, toStack: 2),
            Move(amount: 2, fromStack: 1, toStack: 0),
            Move(amount: 11, fromStack: 0, toStack: 1)
        ]
        let result = parser.parseMoveInput(input)
        XCTAssertEqual(result, expectedResult)
    }
}
