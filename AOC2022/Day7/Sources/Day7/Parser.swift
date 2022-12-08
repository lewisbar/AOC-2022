//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 07.12.22.
//

import Foundation

class Parser {
    func parse(_ input: String, to store: Store) {
        let lines = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .newlines)

        for (lineNumber, line) in lines.enumerated() {
            guard let argument = line.components(separatedBy: .whitespaces).last else {
                print("Unknown command in line \(lineNumber): \(line)")
                continue
            }

            if line.hasPrefix("$ cd") {
                handleCD(argument: argument, store: store)
            } else if line.hasPrefix("$ ls") {
                continue
            } else if line.hasPrefix("dir") {
                store.addDirectory(argument)
            } else {
                guard let rawSize = line.components(separatedBy: .whitespaces).first,
                      let size = Int(rawSize) else {
                    print("No valid file size in line \(lineNumber): \(line)")
                    break
                }
                store.addFile(size)
            }
        }
    }

    private func handleCD(argument: String, store: Store) {
        switch argument {
        case "/": store.moveToRoot()
        case "..": store.moveToParent()
        default: store.move(to: argument)
        }
    }
}

/*
var expectedRoot = Directory(
    childIDs: [],
    parentID: nil,
    fileSizes: [14848514, 8504156]
)
var a = Directory(
    childIDs: [],
    parentID: expectedRoot.id,
    fileSizes: [29116, 2557, 62596]
)
let e = Directory(
    childIDs: [],
    parentID: a.id,
    fileSizes: [584]
)
let d = Directory(
    childIDs: [],
    parentID: expectedRoot.id,
    fileSizes: [4060174, 8033020, 5626152, 7214296]
)
expectedRoot.childIDs = [a.id, d.id]
a.childIDs = [e.id]

return expectedRoot
*/
