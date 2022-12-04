//
//  AOC2022Tests.swift
//  AOC2022Tests
//
//  Created by LennartWisbar on 04.12.22.
//

@testable import AOC2022
import XCTest

final class AOC2022Tests: XCTestCase {
    var sut: ContentViewModel!
    var reader: FileReaderType!

    override func setUp() {
        reader = MockFileReader()
        sut = ContentViewModel(reader: reader)
    }

    override func tearDown() {
        sut = nil
        reader = nil
    }

    func test_day1() {
        let solution = sut.solutions[0]
        XCTAssertEqual(solution.part1, "24000")
        XCTAssertEqual(solution.part2, "45000")
    }

    func test_day2() {
        let solution = sut.solutions[1]
        XCTAssertEqual(solution.part1, "15")
        XCTAssertEqual(solution.part2, "12")
    }

    func test_day3() {
        let solution = sut.solutions[2]
        XCTAssertEqual(solution.part1, "157")
        XCTAssertEqual(solution.part2, "70")
    }

    func test_day4() {
        let solution = sut.solutions[3]
        XCTAssertEqual(solution.part1, "2")
        XCTAssertEqual(solution.part2, "4")
    }
}

struct MockFileReader: FileReaderType {
    func read(_ filename: String, fileExtension: String) -> String {
        switch filename {
        case "InputDay1":
            return """
            1000
            2000
            3000

            4000

            5000
            6000

            7000
            8000
            9000

            10000
            """

        case "InputDay2":
            return """
            A Y
            B X
            C Z
            """

        case "InputDay3":
            return """
            vJrwpWtwJgWrhcsFMMfFFhFp
            jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
            PmmdzqPrVvPwwTWBwg
            wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
            ttgJtRGJQctTZtZT
            CrZsJsPPZsGzwwsLwLmpwMDw
            """

        case "InputDay4":
            return """
            2-4,6-8
            2-3,4-5
            5-7,7-9
            2-8,3-7
            6-6,4-6
            2-6,4-8
            """

        case "InputDay5":
            return ""

        default:
            return "Invalid filename"
        }
    }
}
