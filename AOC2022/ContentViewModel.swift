//
//  ContentViewModel.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation
import Day1

class ContentViewModel: ObservableObject {
    let day1: Day1 = {
        guard let url = Bundle.main.url(forResource: "InputDay1", withExtension: "txt") else {
            print("File not found.")
            return Day1("")
        }
        guard let input = try? String(contentsOf: url) else {
            print("Contents of URL could not be converted to String.")
            return Day1("")
        }
        let day1 = Day1(input)
        return day1
    }()
}
