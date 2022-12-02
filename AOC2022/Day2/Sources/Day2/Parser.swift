//
//  Parser.swift
//  
//
//  Created by LennartWisbar on 02.12.22.
//

import Foundation

struct Parser {
    func parse1(_ input: String) -> [Round] {
        var rounds = [Round]()

        let rawRounds = input.components(separatedBy: .newlines)

        for rawRound in rawRounds {
            let moves = rawRound
                .components(separatedBy: .whitespaces)
                .compactMap { move1(from: $0) }

            guard moves.count == 2 else {
                print("Invalid number of moves in round: \(moves.count) (\(moves)))")
                break
            }

            let round = Round(opponent: moves[0], me: moves[1])
            rounds.append(round)
        }

        return rounds
    }

    func parse2(_ input: String) -> [Round] {
        var rounds = [Round]()

        let rawRounds = input.components(separatedBy: .newlines)

        for rawRound in rawRounds {
            let rawMoves = rawRound
                .components(separatedBy: .whitespaces)

            guard rawMoves.count == 2 else {
                print("Invalid number of moves in round: \(rawMoves.count) (\(rawMoves)))")
                break
            }

            guard let opponent = move1(from: rawMoves[0]),
                  let me = move2(from: rawMoves[1], opponent: opponent) else { break }

            let round = Round(opponent: opponent, me: me)
            rounds.append(round)
        }

        return rounds
    }

    private func move1(from character: String) -> Move? {
        switch character {
        case "A", "X": return .rock
        case "B", "Y": return .paper
        case "C", "Z": return .scissors
        default:
            print("Invalid input: \(character).")
            return nil
        }
    }

    private func move2(from character: String, opponent: Move) -> Move? {
        switch character {
        case "X": return losingMove(for: opponent)
        case "Y": return drawingMove(for: opponent)
        case "Z": return winningMove(for: opponent)
        default:
            print("Invalid input: \(character).")
            return nil
        }
    }

    private func losingMove(for opponent: Move) -> Move {
        switch opponent {
        case .rock: return .scissors
        case .paper: return .rock
        case .scissors: return .paper
        }
    }

    private func drawingMove(for opponent: Move) -> Move {
        switch opponent {
        case .rock: return .rock
        case .paper: return .paper
        case .scissors: return .scissors
        }
    }

    private func winningMove(for opponent: Move) -> Move {
        switch opponent {
        case .rock: return .paper
        case .paper: return .scissors
        case .scissors: return .rock
        }
    }
}
