//
//  ElfPair.swift
//  
//
//  Created by LennartWisbar on 04.12.22.
//

import Foundation

struct ElfPair {
    let elf1: Elf
    let elf2: Elf
    var isRedundant: Bool {
        elf1.isSubsetOrSuperSet(of: elf2)
    }
    var isOverlapping: Bool {
        elf1.overlaps(with: elf2)
    }
}
