import XCTest
@testable import Day3

final class Day3Tests: XCTestCase {
    func test_day3_calculatesCorrectSolution1_fromTextInput()  {
        let input = """
            vJrwpWtwJgWrhcsFMMfFFhFp
            jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
            PmmdzqPrVvPwwTWBwg
            wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
            ttgJtRGJQctTZtZT
            CrZsJsPPZsGzwwsLwLmpwMDw
            """
        let sut = Day3(input)

        XCTAssertEqual(sut.solution1, "157")
    }

    func test_day3_calculatesCorrectSolution2_fromTextInput()  {
        let input = """
            vJrwpWtwJgWrhcsFMMfFFhFp
            jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
            PmmdzqPrVvPwwTWBwg
            wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
            ttgJtRGJQctTZtZT
            CrZsJsPPZsGzwwsLwLmpwMDw
            """
        let sut = Day3(input)

        XCTAssertEqual(sut.solution2, "70")
    }
}
