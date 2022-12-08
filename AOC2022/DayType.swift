//
//  DayType.swift
//  AOC2022
//
//  Created by LennartWisbar on 03.12.22.
//

import Foundation
import Day1
import Day2
import Day3
import Day4
import Day5
import Day6
import Day7
import Day8

protocol DayType {
    init(_ input: String)
    var solution1: String { get }
    var solution2: String { get }
}

enum DayConstants {
    static let dayTypes: [DayType.Type] = [
        Day1.self, Day2.self, Day3.self, Day4.self, Day5.self, Day6.self, Day7.self, Day8.self
    ]
}

extension Day1: DayType {}
extension Day2: DayType {}
extension Day3: DayType {}
extension Day4: DayType {}
extension Day5: DayType {}
extension Day6: DayType {}
extension Day7: DayType {}
extension Day8: DayType {}
