import SwiftUI

public struct SolutionView: View {
    let title: String
    let solution1: String
    let solution2: String

    public init(title: String, solution1: String = "?", solution2: String = "?") {
        self.title = title
        self.solution1 = solution1
        self.solution2 = solution2
    }

    public var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 48, weight: .heavy))
                .fontWeight(.heavy)
                .padding(.bottom, 48)
            HStack {
                Text("Part 1:")
                Text(solution1)
            }
            HStack {
                Text("Part 2:")
                Text(solution2)
            }
        }
        .padding(.top, 48)
        .padding(.bottom, 110)
    }

}

struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(title: "Day 0", solution1: "123", solution2: "456")
    }
}
