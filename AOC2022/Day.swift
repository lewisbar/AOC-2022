//
//  Day.swift
//  AOC2022
//
//  Created by LennartWisbar on 03.12.22.
//

import Foundation
import Day1
import Day2
import Day3
import Day4

protocol Day {
    init(_ input: String)
    var solution1: String { get }
    var solution2: String { get }
}

extension Day1: Day {}
extension Day2: Day {}
extension Day3: Day {}
extension Day4: Day {}
