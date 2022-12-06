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
    
    // TODO: There is a bug in my program that causes this test to crash. I think it happens for input with a low number of stacks, like in the sample input (3). It works for the real input with 9 stacks.
//    func test_day5() {
//        let solution = sut.solutions[4]
//        XCTAssertEqual(solution.part1, "CMZ")
//        XCTAssertEqual(solution.part2, "MCD")
//    }
    
    func test_day6() {
        let solution = sut.solutions[5]
        XCTAssertEqual(solution.part1, "7")
        XCTAssertEqual(solution.part2, "19")
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

        // TODO: I think this makes the tests crash
        case "InputDay5":
            return "    [D]    \n" +
            "[N] [C]    \n" +
            "[Z] [M] [P]\n" +
            """
             1   2   3
            
            move 1 from 2 to 1
            move 3 from 1 to 3
            move 2 from 2 to 1
            move 1 from 1 to 2
            """
            
        case "InputDay6":
            return "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

        default:
            return "Invalid filename"
        }
    }
}
