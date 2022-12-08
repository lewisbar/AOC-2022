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

    func test_observer_findsScenicScoreForSampleTree1() {
        let observer = Observer(forest: sampleForest)
        let result = observer.scenicScore(forTreeAtRow: 1, column: 2)
        XCTAssertEqual(result, 4)
    }

    func test_observer_findsScenicScoreForSampleTree2() {
        let observer = Observer(forest: sampleForest)
        let result = observer.scenicScore(forTreeAtRow: 3, column: 2)
        XCTAssertEqual(result, 8)
    }

    func test_observer_findsEastViewDistanceForSampleTree1() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .east, forTreeAtRow: 1, column: 2)
        XCTAssertEqual(result, 2)
    }

    func test_observer_findsEastViewDistanceForSampleTree2() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .east, forTreeAtRow: 3, column: 2)
        XCTAssertEqual(result, 2)
    }

    func test_observer_findsWestViewDistanceForSampleTree1() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .west, forTreeAtRow: 1, column: 2)
        XCTAssertEqual(result, 1)
    }

    func test_observer_findsWestViewDistanceForSampleTree2() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .west, forTreeAtRow: 3, column: 2)
        XCTAssertEqual(result, 2)
    }

    func test_observer_findsNorthViewDistanceForSampleTree1() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .north, forTreeAtRow: 1, column: 2)
        XCTAssertEqual(result, 1)
    }

    func test_observer_findsNorthViewDistanceForSampleTree2() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .north, forTreeAtRow: 3, column: 2)
        XCTAssertEqual(result, 2)
    }

    func test_observer_findsSouthViewDistanceForSampleTree1() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .south, forTreeAtRow: 1, column: 2)
        XCTAssertEqual(result, 2)
    }

    func test_observer_findsSouthViewDistanceForSampleTree2() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .south, forTreeAtRow: 3, column: 2)
        XCTAssertEqual(result, 1)
    }

    func test_observer_findsSouthViewDistanceForProblemTree() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .south, forTreeAtRow: 2, column: 1)
        XCTAssertEqual(result, 2)
    }

    func test_observer_findsNorthViewDistanceForProblemTree() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .north, forTreeAtRow: 2, column: 1)
        XCTAssertEqual(result, 1)
    }

    func test_observer_findsEastViewDistanceForProblemTree() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .east, forTreeAtRow: 2, column: 1)
        XCTAssertEqual(result, 3)
    }

    func test_observer_findsWestViewDistanceForProblemTree() {
        let observer = Observer(forest: sampleForest)
        let result = observer.viewDistance(in: .west, forTreeAtRow: 2, column: 1)
        XCTAssertEqual(result, 1)
    }
}
