//
//  Round.swift
//  
//
//  Created by LennartWisbar on 02.12.22.
//

import Foundation

enum Move: CaseIterable {
    case rock, paper, scissors
}

struct Round: Equatable {
    let opponent: Move
    let me: Move

    var score: Int {
        switch me {
        case .rock: return rockScore(opponent)
        case .paper: return paperScore(opponent)
        case .scissors: return scissorsScore(opponent)
        }
    }

    private func rockScore(_ opponent: Move) -> Int {
        switch opponent {
        case .rock: return 1 + 3
        case .paper: return 1 + 0
        case .scissors: return 1 + 6
        }
    }

    private func paperScore(_ opponent: Move) -> Int {
        switch opponent {
        case .rock: return 2 + 6
        case .paper: return 2 + 3
        case .scissors: return 2 + 0
        }
    }

    private func scissorsScore(_ opponent: Move) -> Int {
        switch opponent {
        case .rock: return 3 + 0
        case .paper: return 3 + 6
        case .scissors: return 3 + 3
        }
    }
}
