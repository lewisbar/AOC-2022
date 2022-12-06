import XCTest
@testable import Day6

final class Day6Tests: XCTestCase {
    func test_sampleInputProducesSolution1() {
        let input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
        let sut = Day6(input)
        XCTAssertEqual(sut.solution1, "7")
    }
    
    func test_sampleInputProducesSolution2() {
        let input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
        let sut = Day6(input)
        XCTAssertEqual(sut.solution2, "19")
    }
}
