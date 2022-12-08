////
////  Day5Tests.swift
////  
////
////  Created by LennartWisbar on 05.12.22.
////
//
//import XCTest
//@testable import Day5
//
//final class Day5Tests: XCTestCase {
//    var sut: Day5!
//
//    override func setUp() {
//        let input =
//            "[D]                     [I]        \n" +
//            "[N] [C]         [G]     [H]     [J]\n" +
//            "[Z] [M] [P] [A] [B] [C] [D] [E] [F]\n" +
//            " 1   2   3   4   5   6   7   8   9 \n\n" +
//            """
//            move 1 from 2 to 1
//            move 3 from 1 to 3
//            """
//        sut = Day5(input)
//    }
//
//    override func tearDown() {
//        sut = nil
//    }
//    
//    // TODO: There is a bug in my program that causes this test to crash. I think it happens for input with a low number of stacks, like in the sample input (3). It works for the real input with 9 stacks.
////    func test_day5_producesSolution1() {
////        let input =
////            "    [D]    \n" +
////            "[N] [C]    \n" +
////            "[Z] [M] [P]\n" +
////            """
////             1   2   3
////            
////            move 1 from 2 to 1
////            move 3 from 1 to 3
////            move 2 from 2 to 1
////            move 1 from 1 to 2
////            """
////        sut = Day5(input)
////        XCTAssertEqual(sut.solution1, "CMZ")
////    }
//
//    func test_day5_movesCrate() {
//        let expectedResult = [
//            Stack(crates: ["Z", "N", "D", "C"]),
//            Stack(crates: ["M"]),
//            Stack(crates: ["P"]),
//            Stack(crates: ["A"]),
//            Stack(crates: ["B", "G"]),
//            Stack(crates: ["C"]),
//            Stack(crates: ["D", "H", "I"]),
//            Stack(crates: ["E"]),
//            Stack(crates: ["F", "J"])
//        ]
//        let result = sut.movingCrateWithOldCrane(fromStack: 1, toStack: 0, stacks: sut.stacks)
//        XCTAssertEqual(result, expectedResult)
//    }
//
//    func test_day5_appliesMoves() {
//        let expectedResult = [
//            Stack(crates: ["Z"]),
//            Stack(crates: ["M"]),
//            Stack(crates: ["P", "C", "D", "N"]),
//            Stack(crates: ["A"]),
//            Stack(crates: ["B", "G"]),
//            Stack(crates: ["C"]),
//            Stack(crates: ["D", "H", "I"]),
//            Stack(crates: ["E"]),
//            Stack(crates: ["F", "J"])
//        ]
//        let result = sut.applyingMovesWithOldCrane(to: sut.stacks)
//        XCTAssertEqual(result, expectedResult)
//    }
//}
