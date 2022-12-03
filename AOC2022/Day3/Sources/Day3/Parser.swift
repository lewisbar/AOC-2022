//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 02.12.22.
//

import Foundation

struct Parser {
    func parse(_ input: String) -> [Rucksack] {
        input
            .components(separatedBy: .newlines)
            .map { rawRucksack in
                let rawRucksackArray = Array(rawRucksack)
                let half = rawRucksack.count / 2
                return Rucksack(
                    comp1: rawRucksackArray[..<half].compactMap { $0.priority},
                    comp2: rawRucksackArray[half...].compactMap { $0.priority}
                )
            }
    }
}

private extension String {
    var asArray: [Character] { Array(self) }
}

private extension Character {
    var priority: Int? {
        let aScalars = "a".unicodeScalars
        let aCode = aScalars[aScalars.startIndex].value
        let capitalAScalars = "A".unicodeScalars
        let capitalACode = capitalAScalars[capitalAScalars.startIndex].value

        let lowerCaseLetters: [Character] = (0..<26).map {
            i in Character(UnicodeScalar(aCode + i)!)
        }

        let upperCaseLetters: [Character] = (0..<26).map {
            i in Character(UnicodeScalar(capitalACode + i)!)
        }

        let allLetters = lowerCaseLetters + upperCaseLetters

        if let index = allLetters.firstIndex(of: self) {
            return index + 1
        }
        return nil
    }
}
