//
//  SwiftUIView.swift
//  
//
//  Created by LennartWisbar on 01.12.22.
//

import SwiftUI

public struct Day1View: View {
    let model: Day1

    public init(day1: Day1) {
        self.model = day1
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text("Part 1:")
                Text(model.solution1)
            }
            HStack {
                Text("Part 2:")
                Text(model.solution2)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Day1View(day1: Day1("1111\n\n2222\n\n3333"))
    }
}
