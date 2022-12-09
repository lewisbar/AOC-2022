//
//  MoverTests.swift
//  
//
//  Created by LennartWisbar on 09.12.22.
//

import XCTest
@testable import Day9

final class MoverTests: XCTestCase {
    func test_tailPositions_fromSampleMoves_producesSolution1() {
        let sampleMoves: [Move] = [
            .east, .east, .east, .east,
            .north, .north, .north, .north,
            .west, .west, .west,
            .south,
            .east, .east, .east, .east,
            .south,
            .west, .west, .west, .west, .west,
            .east, .east
        ]
        let expectedResult = 13
        
        let mover = Mover()
        let result = mover.numberOfDifferentPositionsTouchedByTail(after: sampleMoves)

        XCTAssertEqual(result, expectedResult)
    }
}
