//
//  ContentView.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import SwiftUI
import SolutionView
import Day1

struct ContentView: View {
    let model: ContentViewModel

    var body: some View {
        TabView {
            ForEach(model.solutions) { solution in
                SolutionView(
                    title: solution.id,
                    solution1: solution.part1,
                    solution2: solution.part2
                )
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ContentViewModel())
    }
}
