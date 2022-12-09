//
//  ParserTests.swift
//  
//
//  Created by LennartWisbar on 09.12.22.
//

import XCTest
@testable import Day9

final class ParserTests: XCTestCase {
    func test_parser_parsesSampleInput() {
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

        let expectedMoves: [Move] = [
            .east, .east, .east, .east,
            .north, .north, .north, .north,
            .west, .west, .west,
            .south,
            .east, .east, .east, .east,
            .south,
            .west, .west, .west, .west, .west,
            .east, .east
        ]

        let parser = Parser()
        let result = parser.parse(input)

        XCTAssertEqual(result, expectedMoves)
    }
}
