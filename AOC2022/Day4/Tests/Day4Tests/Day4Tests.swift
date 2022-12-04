import XCTest
@testable import Day4

final class Day4Tests: XCTestCase {
    func test_day4_producesSolution1_fromTextInput() {
        let input = """
            2-4,6-8
            2-3,4-5
            5-7,7-9
            2-8,3-7
            6-6,4-6
            2-6,4-8
            """
        let sut = Day4(input)
        XCTAssertEqual(sut.solution1, "2")
    }

    func test_day4_producesSolution2_fromTextInput() {
        let input = """
            2-4,6-8
            2-3,4-5
            5-7,7-9
            2-8,3-7
            6-6,4-6
            2-6,4-8
            """
        let sut = Day4(input)
        XCTAssertEqual(sut.solution2, "4")
    }

    func test_elf_subsetOrSuperset_IsDetected() {
        let elf1 = Elf(firstSection: 1, lastSection: 4)
        let elf2 = Elf(firstSection: 2, lastSection: 3)
        XCTAssertTrue(elf1.isSubsetOrSuperSet(of: elf2))
        XCTAssertTrue(elf2.isSubsetOrSuperSet(of:elf1))

        let elf3 = Elf(firstSection: 1, lastSection: 4)
        let elf4 = Elf(firstSection: 2, lastSection: 4)
        XCTAssertTrue(elf3.isSubsetOrSuperSet(of:elf4))
        XCTAssertTrue(elf4.isSubsetOrSuperSet(of:elf3))
    }

    func test_elf_subsetOrSuperset_noFalsePositives() {
        let elf1 = Elf(firstSection: 3, lastSection: 4)
        let elf2 = Elf(firstSection: 2, lastSection: 3)
        XCTAssertFalse(elf1.isSubsetOrSuperSet(of:elf2))
        XCTAssertFalse(elf2.isSubsetOrSuperSet(of:elf1))

        let elf3 = Elf(firstSection: 1, lastSection: 2)
        let elf4 = Elf(firstSection: 2, lastSection: 3)
        XCTAssertFalse(elf3.isSubsetOrSuperSet(of:elf4))
        XCTAssertFalse(elf4.isSubsetOrSuperSet(of:elf3))
    }

    func test_elf_overlapsWithOtherElf_isDetected() {
        let elf1 = Elf(firstSection: 5, lastSection: 7)
        let elf2 = Elf(firstSection: 7, lastSection: 9)
        let elfPair1 = ElfPair(elf1: elf1, elf2: elf2)
        XCTAssertTrue(elf1.overlaps(with: elf2))
        XCTAssertTrue(elfPair1.isOverlapping)

        let elf3 = Elf(firstSection: 5, lastSection: 7)
        let elf4 = Elf(firstSection: 2, lastSection: 5)
        let elfPair2 = ElfPair(elf1: elf3, elf2: elf4)
        XCTAssertTrue(elf3.overlaps(with: elf4))
        XCTAssertTrue(elfPair2.isOverlapping)

        let elf5 = Elf(firstSection: 4, lastSection: 7)
        let elf6 = Elf(firstSection: 5, lastSection: 6)
        let elfPair3 = ElfPair(elf1: elf5, elf2: elf6)
        XCTAssertTrue(elf5.overlaps(with: elf6))
        XCTAssertTrue(elfPair3.isOverlapping)
    }

    func test_elf_overlapsWithOtherElf_noFalsePositives() {
        let elf1 = Elf(firstSection: 5, lastSection: 7)
        let elf2 = Elf(firstSection: 1, lastSection: 4)
        let elfPair1 = ElfPair(elf1: elf1, elf2: elf2)
        XCTAssertFalse(elf1.overlaps(with: elf2))
        XCTAssertFalse(elfPair1.isOverlapping)

        let elf3 = Elf(firstSection: 5, lastSection: 7)
        let elf4 = Elf(firstSection: 8, lastSection: 9)
        let elfPair2 = ElfPair(elf1: elf3, elf2: elf4)
        XCTAssertFalse(elf3.overlaps(with: elf4))
        XCTAssertFalse(elfPair2.isOverlapping)
    }
}
