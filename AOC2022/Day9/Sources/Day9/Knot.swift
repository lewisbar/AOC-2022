//
//  Knot.swift
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
