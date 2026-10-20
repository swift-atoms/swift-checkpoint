extension Swift.Substring {

    public struct Checkpoint: Equatable {
        internal let input: Swift::Substring
        internal init(_ input: Swift::Substring) { self.input = input }
    }
}

extension Substring.Checkpoint {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.input.startIndex == rhs.input.startIndex
    }
}
