import XCTest
@testable import Day8

final class ObserverTests: XCTestCase {
    func test_observer_countsVisibleTrees() {
        let forest = Forest(rows: [
            Row(trees: [
                Tree(height: 9),
                Tree(height: 9),
                Tree(height: 9)
            ]),
            Row(trees: [
                Tree(height: 9),
                Tree(height: 0),
                Tree(height: 9)
            ]),
            Row(trees: [
                Tree(height: 9),
                Tree(height: 9),
                Tree(height: 9)
            ])
        ])

        let observer = Observer(forest: forest)
        let result = observer.numberOfVisibleTrees

        XCTAssertEqual(result, 8)
    }

    func test_lookEast() {
        let forest = Forest(rows: [
            Row(trees: [
                Tree(height: 9),
                Tree(height: 9),
                Tree(height: 9)
            ]),
            Row(trees: [
                Tree(height: 0),
                Tree(height: 5),
                Tree(height: 9)
            ]),
            Row(trees: [
                Tree(height: 9),
                Tree(height: 9),
                Tree(height: 9)
            ])
        ])

        let observer = Observer(forest: forest)
        let result = observer.lookEast(inRow: 1).count

        XCTAssertEqual(result, 3)
    }

    func test_lookWest() {
        let forest = Forest(rows: [
            Row(trees: [
                Tree(height: 9),
                Tree(height: 9),
                Tree(height: 9)
            ]),
            Row(trees: [
                Tree(height: 5),
                Tree(height: 5),
                Tree(height: 2)
            ]),
            Row(trees: [
                Tree(height: 9),
                Tree(height: 9),
                Tree(height: 9)
            ])
        ])

        let observer = Observer(forest: forest)
        let result = observer.lookWest(inRow: 1).count

        XCTAssertEqual(result, 2)
    }

    func test_lookSouth() {
        let forest = Forest(rows: [
            Row(trees: [
                Tree(height: 9),
                Tree(height: 4),
                Tree(height: 4)
            ]),
            Row(trees: [
                Tree(height: 5),
                Tree(height: 9),
                Tree(height: 5)
            ]),
            Row(trees: [
                Tree(height: 9),
                Tree(height: 9),
                Tree(height: 9)
            ])
        ])

        let observer = Observer(forest: forest)
        let result = observer.lookSouth(inColumn: 2).count

        XCTAssertEqual(result, 3)
    }

    func test_lookNorth() {
        let forest = Forest(rows: [
            Row(trees: [
                Tree(height: 9),
                Tree(height: 7),
                Tree(height: 4)
            ]),
            Row(trees: [
                Tree(height: 5),
                Tree(height: 2),
                Tree(height: 5)
            ]),
            Row(trees: [
                Tree(height: 9),
                Tree(height: 6),
                Tree(height: 9)
            ])
        ])

        let observer = Observer(forest: forest)
        let result = observer.lookNorth(inColumn: 1).count

        XCTAssertEqual(result, 2)
    }
}
