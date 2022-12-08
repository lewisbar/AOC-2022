//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 08.12.22.
//

import Foundation

class Parser {
    func parse(_ input: String) -> Forest {
        let lines = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .newlines)

        let rows = lines.map { line in
            let trees = Array(line)
                .map { String($0) }
                .map { Int($0)! }
                .map { Tree(height: $0) }

            return Row(trees: trees)
        }

        return Forest(rows: rows)
    }
}
