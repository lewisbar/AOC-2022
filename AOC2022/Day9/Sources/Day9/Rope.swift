//
//  Rope.swift
//  
//
//  Created by LennartWisbar on 09.12.22.
//

import Foundation

class Rope {
    struct Position: Hashable { var x, y: Int }

    var knots: [Knot]

    var head: Knot { knots[0] }
    var tail: Knot { knots[knots.count-1] }
    var tailPosition: Position { Position(x: tail.x, y: tail.y)}

    init(knotCount: Int) {
        self.knots = Array(0..<knotCount).map { _ in Knot() }
    }

    func numberOfDifferentPositionsTouchedByTail(after moves: [Move]) -> Int {
        var touchedPositions = Set<Position>()

        for move in moves {
            moveHead(move)

            for (index, knot) in knots.dropFirst().enumerated() {
                knot.follow(knots[index])
            }

            touchedPositions.insert(tailPosition)
        }

        return touchedPositions.count
    }

    private func moveHead(_ move: Move) {
        switch move {
        case .east: head.x += 1
        case .west: head.x -= 1
        case .north: head.y += 1
        case .south: head.y -= 1
        }
    }
}
