//
//  RopeTests.swift
//  
//
//  Created by LennartWisbar on 09.12.22.
//

import XCTest
@testable import Day9

final class RopeTests: XCTestCase {
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
        
        let rope = Rope(knotCount: 2)
        let result = rope.numberOfDifferentPositionsTouchedByTail(after: sampleMoves)

        XCTAssertEqual(result, expectedResult)
    }

    func test_tailPositions_fromSampleMoves_producesSolution2() {
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
        let expectedResult = 1

        let rope = Rope(knotCount: 10)
        let result = rope.numberOfDifferentPositionsTouchedByTail(after: sampleMoves)

        XCTAssertEqual(result, expectedResult)
    }

    func test_positions_areUniqueInSet() {
        let p1 = Rope.Position(x: 0, y: 0)
        let p2 = Rope.Position(x: 0, y: 0)
        let p3 = Rope.Position(x: 0, y: 1)
        let p4 = Rope.Position(x: 1, y: 0)
        let p5 = Rope.Position(x: 1, y: 0)
        var positions = Set<Rope.Position>()
        positions.insert(p1)
        positions.insert(p2)
        positions.insert(p3)
        positions.insert(p4)
        positions.insert(p5)
        XCTAssertEqual(positions.count, 3)
    }

    func test_tailPositions_withTwoKnots_producesCorrectResult() {
        let sampleMoves: [Move] = [
            .east, .east,
            .north
        ]
        let expectedResult = 2

        let rope = Rope(knotCount: 2)
        let result = rope.numberOfDifferentPositionsTouchedByTail(after: sampleMoves)

        XCTAssertEqual(result, expectedResult)
    }
}

final class KnotTests: XCTestCase {
    func test_follow_followsNorth() {
        let head = Knot(x: 0, y: 2)
        let tail = Knot(x: 0, y: 0)
        tail.follow(head)
        XCTAssertEqual(tail.x, 0)
        XCTAssertEqual(tail.y, 1)
    }

    func test_follow_followsEast() {
        let head = Knot(x: 2, y: 0)
        let tail = Knot(x: 0, y: 0)
        tail.follow(head)
        XCTAssertEqual(tail.x, 1)
        XCTAssertEqual(tail.y, 0)
    }

    func test_follow_followsSouth() {
        let head = Knot(x: 0, y: -2)
        let tail = Knot(x: 0, y: 0)
        tail.follow(head)
        XCTAssertEqual(tail.x, 0)
        XCTAssertEqual(tail.y, -1)
    }

    func test_follow_followsWest() {
        let head = Knot(x: -2, y: 0)
        let tail = Knot(x: 0, y: 0)
        tail.follow(head)
        XCTAssertEqual(tail.x, -1)
        XCTAssertEqual(tail.y, 0)
    }

    func test_follow_followsNorthEast() {
        let head1 = Knot(x: 1, y: 2)
        let tail1 = Knot(x: 0, y: 0)
        tail1.follow(head1)
        XCTAssertEqual(tail1.x, 1)
        XCTAssertEqual(tail1.y, 1)

        let head2 = Knot(x: 2, y: 1)
        let tail2 = Knot(x: 0, y: 0)
        tail2.follow(head2)
        XCTAssertEqual(tail2.x, 1)
        XCTAssertEqual(tail2.y, 1)
    }

    func test_follow_followsSouthWest() {
        let head1 = Knot(x: -1, y: -2)
        let tail1 = Knot(x: 0, y: 0)
        tail1.follow(head1)
        XCTAssertEqual(tail1.x, -1)
        XCTAssertEqual(tail1.y, -1)

        let head2 = Knot(x: -2, y: -1)
        let tail2 = Knot(x: 0, y: 0)
        tail2.follow(head2)
        XCTAssertEqual(tail2.x, -1)
        XCTAssertEqual(tail2.y, -1)
    }

    func test_follow_startingDiagonallyMovingNorth_doesNotMove() {
        let head = Knot(x: 2, y: 1)
        let tail = Knot(x: 1, y: 0)
        tail.follow(head)
        XCTAssertEqual(tail.x, 1)
        XCTAssertEqual(tail.y, 0)
    }
}
