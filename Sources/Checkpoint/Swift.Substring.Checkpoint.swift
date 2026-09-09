extension Swift.Substring {
    /// Captures the input value. Equality compares cursor position for progress detection.
    public struct Checkpoint: Equatable {
        internal let input: Swift.Substring
        internal init(_ input: Swift.Substring) { self.input = input }
        public static func == (lhs: Self, rhs: Self) -> Bool { lhs.input.startIndex == rhs.input.startIndex }
    }
}
