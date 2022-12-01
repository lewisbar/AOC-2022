//
//  Elf.swift
//  
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation

struct Elf: Equatable {
    let foodItems: [Int]
    var totalCalories: Int {
        foodItems.reduce(0, +)
    }
}
