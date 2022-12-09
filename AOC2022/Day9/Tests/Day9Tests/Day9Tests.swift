import XCTest
@testable import Day9

final class Day9Tests: XCTestCase {
    func test_sampleInput_producesSolution1() {
        let input = """
            R 4
            U 4
            L 3
            D 1
            R 4
            D 1
            L 5
            R 2
            """
        let day9 = Day9(input)
        XCTAssertEqual(day9.solution1, "13")
    }

    func test_sampleInput_producesSolution2() {
        let input = """
            R 4
            U 4
            L 3
            D 1
            R 4
            D 1
            L 5
            R 2
            """
        let day9 = Day9(input)
        XCTAssertEqual(day9.solution2, "1")
    }
}
