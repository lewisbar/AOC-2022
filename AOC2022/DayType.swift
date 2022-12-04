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

protocol DayType {
    init(_ input: String)
    var solution1: String { get }
    var solution2: String { get }
}

enum DayConstants {
    static let dayTypes: [DayType.Type] = [
        Day1.self, Day2.self, Day3.self, Day4.self
    ]
}

extension Day1: DayType {}
extension Day2: DayType {}
extension Day3: DayType {}
extension Day4: DayType {}