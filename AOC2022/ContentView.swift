//
//  ContentView.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import SwiftUI
import Day1

struct ContentView: View {
    let model: ContentViewModel

    var body: some View {
        Day1View(day1: model.day1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ContentViewModel())
    }
}
