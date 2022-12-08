//
//  Day8Tests.swift
//  
//
//  Created by LennartWisbar on 08.12.22.
//

import XCTest
@testable import Day8

final class Day8Tests: XCTestCase {
    let sampleInput = """
            30373
            25512
            65332
            33549
            35390
            """

    func test_day8_withSampleInput_producesSolution1() {
        let day8 = Day8(sampleInput)
        XCTAssertEqual(day8.solution1, "21")
    }

    func test_day8_withSampleInput_producesSolution2() {
        let day8 = Day8(sampleInput)
        XCTAssertEqual(day8.solution2, "8")
    }
}
