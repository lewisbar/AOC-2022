//
//  Forest.swift
//  
//
//  Created by LennartWisbar on 08.12.22.
//

import Foundation

struct Forest: Equatable {
    let rows: [Row]
}

struct Row: Equatable {
    let trees: [Tree]
}

struct Tree: Identifiable, Hashable, Equatable {
    let id = UUID()
    let height: Int
}
