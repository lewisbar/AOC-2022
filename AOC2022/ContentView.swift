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
        SolutionView(title: "Day 1", solution1: model.day1.solution1, solution2: model.day1.solution2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ContentViewModel())
    }
}
