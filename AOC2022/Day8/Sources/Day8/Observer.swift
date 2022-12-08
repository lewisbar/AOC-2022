//
//  File.swift
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

    func lookEast(inRow rowIndex: Int) -> [Tree] {
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

    func lookWest(inRow rowIndex: Int) -> [Tree] {
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

    func lookSouth(inColumn columnIndex: Int) -> [Tree] {
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

    func lookNorth(inColumn columnIndex: Int) -> [Tree] {
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
}

struct Forest {
    let rows: [Row]
}

struct Row {
    let trees: [Tree]
}

struct Tree: Identifiable, Hashable {
    let id = UUID()
    let height: Int
}
