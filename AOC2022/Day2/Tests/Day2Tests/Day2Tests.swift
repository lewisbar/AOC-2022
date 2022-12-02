import XCTest
@testable import Day2

final class Day2Tests: XCTestCase {
    let sampleInput = """
            A Y
            B X
            C Z
            """
    let sampleSolution1 = "15"
    let sampleSolution2 = "12"

    func test_round_calculatesRockScore() {
        var sut = Round(opponent: .rock, me: .rock)
        XCTAssertEqual(sut.score, 4)

        sut = Round(opponent: .paper, me: .rock)
        XCTAssertEqual(sut.score, 1)

        sut = Round(opponent: .scissors, me: .rock)
        XCTAssertEqual(sut.score, 7)
    }

    func test_round_calculatesPaperScore() {
        var sut = Round(opponent: .rock, me: .paper)
        XCTAssertEqual(sut.score, 8)

        sut = Round(opponent: .paper, me: .paper)
        XCTAssertEqual(sut.score, 5)

        sut = Round(opponent: .scissors, me: .paper)
        XCTAssertEqual(sut.score, 2)
    }

    func test_round_calculatesScissorsScore() {
        var sut = Round(opponent: .rock, me: .scissors)
        XCTAssertEqual(sut.score, 3)

        sut = Round(opponent: .paper, me: .scissors)
        XCTAssertEqual(sut.score, 9)

        sut = Round(opponent: .scissors, me: .scissors)
        XCTAssertEqual(sut.score, 6)
    }

    func test_day2_calculatesSolution1() {
        let sut = Day2("")
        sut.rounds1 = [
            Round(opponent: .rock, me: .paper),
            Round(opponent: .paper, me: .rock),
            Round(opponent: .scissors, me: .scissors)
        ]
        XCTAssertEqual(sut.solution1, sampleSolution1)
    }

    func test_parser_part1() {
        let sut = Parser()
        let result = sut.parse1(
            """
            A Y
            B X
            C Z
            """
        )
        let expectedResult = [
            Round(opponent: .rock, me: .paper),
            Round(opponent: .paper, me: .rock),
            Round(opponent: .scissors, me: .scissors)
        ]
        XCTAssertEqual(result, expectedResult)
    }

    func test_day2_calculatesSolution1_fromInput() {
        let sut = Day2(
            """
            A Y
            B X
            C Z
            """
        )
        XCTAssertEqual(sut.solution1, sampleSolution1)
    }

    func test_day2_calculatesSolution2() {
        let sut = Day2("")
        sut.rounds2 = [
            Round(opponent: .rock, me: .rock),
            Round(opponent: .paper, me: .rock),
            Round(opponent: .scissors, me: .rock)
        ]
        XCTAssertEqual(sut.solution2, sampleSolution2)
    }

    func test_parser_part2() {
        let sut = Parser()
        let result = sut.parse2(
            """
            A Y
            B X
            C Z
            """
        )
        let expectedResult = [
            Round(opponent: .rock, me: .rock),
            Round(opponent: .paper, me: .rock),
            Round(opponent: .scissors, me: .rock)
        ]
        XCTAssertEqual(result, expectedResult)
    }

    func test_day2_calculatesSolution2_fromInput() {
        let sut = Day2(
            """
            A Y
            B X
            C Z
            """
        )
        XCTAssertEqual(sut.solution2, sampleSolution2)
    }
}
