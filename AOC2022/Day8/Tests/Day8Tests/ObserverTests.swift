import XCTest
@testable import Day8

final class ObserverTests: XCTestCase {
    let sampleForest = Forest(rows: [
        Row(trees: [
            Tree(height: 3),
            Tree(height: 0),
            Tree(height: 3),
            Tree(height: 7),
            Tree(height: 3)
        ]),
        Row(trees: [
            Tree(height: 2),
            Tree(height: 5),
            Tree(height: 5),
            Tree(height: 1),
            Tree(height: 2)
        ]),
        Row(trees: [
            Tree(height: 6),
            Tree(height: 5),
            Tree(height: 3),
            Tree(height: 3),
            Tree(height: 2)
        ]),
        Row(trees: [
            Tree(height: 3),
            Tree(height: 3),
            Tree(height: 5),
            Tree(height: 4),
            Tree(height: 9)
        ]),
        Row(trees: [
            Tree(height: 3),
            Tree(height: 5),
            Tree(height: 3),
            Tree(height: 9),
            Tree(height: 0)
        ])
    ])

    func test_observer_countsVisibleTrees() {
        let observer = Observer(forest: sampleForest)
        let result = observer.numberOfVisibleTrees
        XCTAssertEqual(result, 21)
    }

    func test_observer_findsHighestScenicScore() {
        let observer = Observer(forest: sampleForest)
        let result = observer.highestScenicScore
        XCTAssertEqual(result, 8)
    }
}
