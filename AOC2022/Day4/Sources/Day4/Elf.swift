//
//  Elf.swift
//  
//
//  Created by LennartWisbar on 04.12.22.
//

import Foundation

struct Elf {
    let firstSection: Int
    let lastSection: Int
    var sections: [Int] {
        Array(firstSection...lastSection)
    }

    func isSubsetOrSuperSet(of otherElf: Elf) -> Bool {
        isSubset(of: otherElf) || isSuperset(of: otherElf)
    }

    func isSubset(of otherElf: Elf) -> Bool {
        (firstSection >= otherElf.firstSection &&
         lastSection <= otherElf.lastSection)
    }

    func isSuperset(of otherElf: Elf) -> Bool {
        (firstSection <= otherElf.firstSection &&
         lastSection >= otherElf.lastSection)
    }

    func overlaps(with otherElf: Elf) ->Bool {
        (firstSection >= otherElf.firstSection &&
         firstSection <= otherElf.lastSection) ||
        (lastSection <= otherElf.lastSection &&
         lastSection >= otherElf.firstSection) ||
        (otherElf.firstSection >= firstSection &&
         otherElf.firstSection <= lastSection) ||
        (otherElf.lastSection <= lastSection &&
         otherElf.lastSection >= firstSection)
    }
}

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
