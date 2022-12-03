//
//  Rucksack.swift
//  
//
//  Created by LennartWisbar on 03.12.22.
//

import Foundation

struct Rucksack {
    let comp1: [Int]
    let comp2: [Int]

    var commonItem: Int? {
        comp1.first(where: {
            comp2.contains($0)
        })
    }

    var allItems: [Int] {
        comp1 + comp2
    }
}
