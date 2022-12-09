//
//  Rope.swift
//  
//
//  Created by LennartWisbar on 09.12.22.
//

import Foundation

class Knot {
    var x = 0
    var y = 0

    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }

    func follow(_ knot: Knot) {
        if knot.x - x > 1 {
            x += 1

            if knot.y > y {
                y += 1
            } else if knot.y < y {
                y -= 1
            }

        } else if knot.x - x < -1 {
            x -= 1

            if knot.y > y {
                y += 1
            } else if knot.y < y {
                y -= 1
            }

        } else if knot.y - y > 1 {
            y += 1

            if knot.x > x {
                x += 1
            } else if knot.x < x {
                x -= 1
            }

        } else if knot.y - y < -1 {
            y -= 1

            if knot.x > x {
                x += 1
            } else if knot.x < x {
                x -= 1
            }
        }
    }
}

class Rope {
    struct Position: Hashable { var x, y: Int }

    var knots: [Knot]

    var head: Knot { knots[0] }
    var tail: Knot { knots[knots.count-1] }
    var headPosition: Position { Position(x: head.x, y: head.y) }
    var tailPosition: Position { Position(x: tail.x, y: tail.y)}

    init(knotCount: Int = 2) {
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
