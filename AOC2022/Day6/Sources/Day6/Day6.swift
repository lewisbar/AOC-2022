struct Segment {
    var characters: [Character]
    
    var isStartOfPacketMarker: Bool {
        Set(characters).count == 4
    }
    
    var isStartOfMessageMarker: Bool {
        Set(characters).count == 14
    }
}

public class Day6 {
    private let input: [Character]

    required public init(_ input: String) {
        self.input = Array(input)
    }
    
    public var solution1: String {
        for index in 0..<input.count - 4 {
            let segment = Segment(characters: Array(input[index..<index+4]))
            if segment.isStartOfPacketMarker {
                return String(index + 4)
            }
        }
        return "No marker found"
    }
    
    public var solution2: String {
        for index in 0..<input.count - 14 {
            let segment = Segment(characters: Array(input[index..<index+14]))
            if segment.isStartOfMessageMarker {
                return String(index + 14)
            }
        }
        return "No marker found"
    }
}
