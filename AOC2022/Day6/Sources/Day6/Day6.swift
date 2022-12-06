public class Day6 {
    private let input: [Character]

    required public init(_ input: String) {
        self.input = Array(input)
    }
    
    public var solution1: String {
        markerPosition(for: 4)?.asString ?? "No marker found"
    }
    
    public var solution2: String {
        markerPosition(for: 14)?.asString ?? "No marker found"
    }

    private func markerPosition(for length: Int) -> Int? {
        for index in 0..<input.count - length {
            let segment = input[index..<index+length]
            if Set(segment).count == length {
                return index + length
            }
        }
        return nil
    }
}

private extension Int {
    var asString: String {
        String(self)
    }
}
