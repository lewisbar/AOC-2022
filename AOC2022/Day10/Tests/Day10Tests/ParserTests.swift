//
//  ParserTests.swift
//  
//
//  Created by LennartWisbar on 10.12.22.
//

import XCTest
@testable import Day10

final class ParserTests: XCTestCase {
    func test_parse_parsesSampleInput() {
        let input = """
            noop
            addx 3
            addx -5
            """
        let expectedCommands: [Command] = [
            .noop,
            .addx(3),
            .addx(-5)
        ]
        let resultCommands = Parser.parse(input)
        XCTAssertEqual(resultCommands, expectedCommands)
    }
}
