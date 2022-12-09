//
//  Mover.swift
//  
//
//  Created by LennartWisbar on 09.12.22.
//

import Foundation

class Mover {
    struct Position: Hashable, Equatable {  var x, y: Int }

    var headPosition = Position(x: 0, y: 0)
    var tailPosition = Position(x: 0, y: 0)

    func numberOfDifferentPositionsTouchedByTail(after moves: [Move]) -> Int {
        var touchedPositions = Set<Position>()

        for move in moves {
            moveHead(move)
            moveTail()
            touchedPositions.insert(tailPosition)
        }

        return touchedPositions.count
    }

    func moveHead(_ move: Move) {
        switch move {
        case .east: headPosition.x += 1
        case .west: headPosition.x -= 1
        case .north: headPosition.y += 1
        case .south: headPosition.y -= 1
        }
    }

    func moveTail() {
        if headPosition.x - tailPosition.x > 1 {
            tailPosition.x += 1

            if headPosition.y > tailPosition.y {
                tailPosition.y += 1
            } else if headPosition.y < tailPosition.y {
                tailPosition.y -= 1
            }

        } else if headPosition.x - tailPosition.x < -1 {
            tailPosition.x -= 1

            if headPosition.y > tailPosition.y {
                tailPosition.y += 1
            } else if headPosition.y < tailPosition.y {
                tailPosition.y -= 1
            }

        } else if headPosition.y - tailPosition.y > 1 {
            tailPosition.y += 1

            if headPosition.x > tailPosition.x {
                tailPosition.x += 1
            } else if headPosition.x < tailPosition.x {
                tailPosition.x -= 1
            }

        } else if headPosition.y - tailPosition.y < -1 {
            tailPosition.y -= 1

            if headPosition.x > tailPosition.x {
                tailPosition.x += 1
            } else if headPosition.x < tailPosition.x {
                tailPosition.x -= 1
            }
        }
    }
}
