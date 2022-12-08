//
//  Observer.swift
//  
//
//  Created by LennartWisbar on 08.12.22.
//

import Foundation

class Observer {
    let forest: Forest

    init(forest: Forest) {
        self.forest = forest
    }

    // MARK: - Part 1
    var numberOfVisibleTrees: Int {
        var visibleTrees = Set<Tree>()

        for rowIndex in forest.rows.indices {
            lookEast(inRow: rowIndex).forEach {
                visibleTrees.insert($0)
            }
            lookWest(inRow: rowIndex).forEach {
                visibleTrees.insert($0)
            }
        }
        for columnIndex in 0..<forest.rows[0].trees.count {
            lookSouth(inColumn: columnIndex).forEach {
                visibleTrees.insert($0)
            }
            lookNorth(inColumn: columnIndex).forEach {
                visibleTrees.insert($0)
            }
        }

        return visibleTrees.count
    }

    private func lookEast(inRow rowIndex: Int) -> [Tree] {
        var highest = -1
        var visibleTrees = [Tree]()

        for tree in forest.rows[rowIndex].trees {
            if tree.height > highest {
                visibleTrees.append(tree)
                highest = tree.height
            }
        }

        return visibleTrees
    }

    private func lookWest(inRow rowIndex: Int) -> [Tree] {
        var highest = -1
        var visibleTrees = [Tree]()

        for tree in forest.rows[rowIndex].trees.reversed() {
            if tree.height > highest {
                visibleTrees.append(tree)
                highest = tree.height
            }
        }

        return visibleTrees
    }

    private func lookSouth(inColumn columnIndex: Int) -> [Tree] {
        var highest = -1
        var visibleTrees = [Tree]()

        for row in forest.rows {
            let tree = row.trees[columnIndex]

            if tree.height > highest {
                visibleTrees.append(tree)
                highest = tree.height
            }
        }

        return visibleTrees
    }

    private func lookNorth(inColumn columnIndex: Int) -> [Tree] {
        var highest = -1
        var visibleTrees = [Tree]()

        for row in forest.rows.reversed() {
            let tree = row.trees[columnIndex]

            if tree.height > highest {
                visibleTrees.append(tree)
                highest = tree.height
            }
        }

        return visibleTrees
    }


    // MARK: - Part 2
    enum Direction { case north, east, south, west }

    var highestScenicScore: Int {
        var highScore = 0

        for rowIndex in forest.rows.indices.dropFirst().dropLast() {
            for columnIndex in forest.rows[rowIndex].trees.indices.dropFirst().dropLast() {
                let score = scenicScore(forTreeAtRow: rowIndex, column: columnIndex)
                highScore = max(score, highScore)
                print(score, rowIndex, columnIndex)
            }
        }

        return highScore
    }

    func scenicScore(forTreeAtRow rowIndex: Int, column columnIndex: Int) -> Int {
        viewDistance(in: .north, forTreeAtRow: rowIndex, column: columnIndex) *
        viewDistance(in: .east, forTreeAtRow: rowIndex, column: columnIndex) *
        viewDistance(in: .south, forTreeAtRow: rowIndex, column: columnIndex) *
        viewDistance(in: .west, forTreeAtRow: rowIndex, column: columnIndex)
    }

    func viewDistance(in direction: Direction, forTreeAtRow rowIndex: Int, column columnIndex: Int) -> Int {
        let row = forest.rows[rowIndex]
        let tree = row.trees[columnIndex]

        let neighbors = neighbors(
            in: direction,
            forTreeAtRow: rowIndex,
            columnIndex: columnIndex
        )

        var distance = 0

        for neighbor in neighbors {
            distance += 1

            if neighbor.height >= tree.height {
                break
            }
        }

        return distance
    }

    func neighbors(in direction: Direction, forTreeAtRow rowIndex: Int, columnIndex: Int) -> ArraySlice<Tree> {
        switch direction {
        case .north:
            guard rowIndex > 0 else { return ArraySlice<Tree>() }
            var columnTrees = [Tree]()
            for row in forest.rows {
                columnTrees.append(row.trees[columnIndex])
            }
            let startIndex = columnTrees.count - rowIndex
            return columnTrees.reversed()[startIndex..<columnTrees.count]
        case .east:
            guard columnIndex < forest.rows[0].trees.count else { return ArraySlice<Tree>() }
            let row = forest.rows[rowIndex]
            return row.trees[columnIndex+1..<row.trees.count]
        case .south:
            guard rowIndex < forest.rows.count else { return ArraySlice<Tree>() }
            var columnTrees = [Tree]()
            for row in forest.rows {
                columnTrees.append(row.trees[columnIndex])
            }
            return columnTrees[rowIndex+1..<columnTrees.count]
        case .west:
            guard columnIndex > 0 else { return ArraySlice<Tree>() }
            let row = forest.rows[rowIndex]
            let startIndex = row.trees.count - columnIndex
            return row.trees.reversed()[startIndex..<row.trees.count]
        }
    }
}
