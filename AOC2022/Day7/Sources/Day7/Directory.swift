//
//  Directory.swift
//  
//
//  Created by LennartWisbar on 07.12.22.
//

import Foundation

struct Directory: Identifiable, Equatable {
    let id = UUID()
    let name: String
    var children: [Directory]
    let parentID: UUID?
    let level: Int  // TODO: Not needed anymore?
    var fileSizes: [Int]

    var size: Int {
        fileSizes.reduce(0, +) + children.map { $0.size }.reduce(0, +)
    }
}
