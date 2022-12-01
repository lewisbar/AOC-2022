import XCTest
@testable import Day1

final class Day1Tests: XCTestCase {
    // MARK: - Part 1
    func test_elf_totalCalories() {
        let sut = Elf(foodItems: [2, 3, 5, 1, 0])
        XCTAssertEqual(sut.totalCalories, 11)
    }

    func test_day1_findsElfWithMostCalories() {
        let sut = Day1("")
        sut.elves = [
            Elf(foodItems: [1, 1, 1]),
            Elf(foodItems: [1, 1, 2]),
            Elf(foodItems: [2, 2, 2]),
            Elf(foodItems: [2, 1, 2]),
        ]
        XCTAssertEqual(sut.elfWithMostCalories.foodItems, [2, 2, 2])
    }

    func test_day1_findsSolution() {
        let sut = Day1("")
        sut.elves = [
            Elf(foodItems: [1, 1, 1]),
            Elf(foodItems: [1, 1, 2]),
            Elf(foodItems: [2, 2, 2]),
            Elf(foodItems: [2, 1, 2]),
        ]
        XCTAssertEqual(sut.solution1, "6")
    }

    func test_parser_createsElves() {
        let sut = Parser()
        let input =
            """
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
        let expectedResult = [
            Elf(foodItems: [
                1000,
                2000,
                3000
            ]),
            Elf(foodItems: [
                4000
            ]),
            Elf(foodItems: [
                5000,
                6000
            ]),
            Elf(foodItems: [
                7000,
                8000,
                9000
            ]),
            Elf(foodItems: [
                10000
            ])
        ]
        let result = sut.parse(input)
        XCTAssertEqual(result, expectedResult)
    }

    // MARK: - Part 2
    func test_day1_findsTop3Elves() {
        let sut = Day1("")
        sut.elves = [
            Elf(foodItems: [1, 1, 1]),
            Elf(foodItems: [1, 1, 2]),
            Elf(foodItems: [2, 2, 2]),
            Elf(foodItems: [2, 1, 2]),
        ]
        let expectedResult = [
            Elf(foodItems: [2, 2, 2]),
            Elf(foodItems: [2, 1, 2]),
            Elf(foodItems: [1, 1, 2])
        ]
        XCTAssertEqual(sut.topThreeElves, expectedResult)
    }

    func test_day1_calculatesTotalCaloriesOfTop3Elves() {
        let sut = Day1("")
        sut.elves = [
            Elf(foodItems: [1, 1, 1]),
            Elf(foodItems: [1, 1, 2]),
            Elf(foodItems: [2, 2, 2]),
            Elf(foodItems: [2, 1, 2]),
        ]
        XCTAssertEqual(sut.solution2, "15")
    }
}
