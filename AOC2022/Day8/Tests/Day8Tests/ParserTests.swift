//
//  ParserTests.swift
//  
//
//  Created by LennartWisbar on 08.12.22.
//

import XCTest
@testable import Day8

//final class ParserTests: XCTestCase {
//
//    // TODO: Does not work right now because of different IDs
//    func test_parse_sampleInput_returnsForest() {
//        let input = """
//            30373
//            25512
//            65332
//            33549
//            35390
//            """
//        let parser = Parser()
//        let expectedForest = Forest(rows: [
//            Row(trees: [
//                Tree(height: 3),
//                Tree(height: 0),
//                Tree(height: 3),
//                Tree(height: 7),
//                Tree(height: 3)
//            ]),
//            Row(trees: [
//                Tree(height: 2),
//                Tree(height: 5),
//                Tree(height: 5),
//                Tree(height: 1),
//                Tree(height: 2)
//            ]),
//            Row(trees: [
//                Tree(height: 6),
//                Tree(height: 5),
//                Tree(height: 3),
//                Tree(height: 3),
//                Tree(height: 2)
//            ]),
//            Row(trees: [
//                Tree(height: 3),
//                Tree(height: 3),
//                Tree(height: 5),
//                Tree(height: 4),
//                Tree(height: 9)
//            ]),
//            Row(trees: [
//                Tree(height: 3),
//                Tree(height: 5),
//                Tree(height: 3),
//                Tree(height: 9),
//                Tree(height: 0)
//            ])
//        ])
//        let resultForest = parser.parse(input)
//
//        XCTAssertEqual(resultForest, expectedForest)
//    }
//}
