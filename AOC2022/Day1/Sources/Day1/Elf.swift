//
//  Elf.swift
//  
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation

struct Elf: Equatable, Comparable {
    let foodItems: [Int]

    var totalCalories: Int {
        foodItems.reduce(0, +)
    }

    static func < (lhs: Elf, rhs: Elf) -> Bool {
        lhs.totalCalories < rhs.totalCalories
    }
}
