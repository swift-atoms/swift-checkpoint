extension Swift.ArraySlice {
    /// Captures the input value. Equality compares cursor position for progress detection.
    public struct Checkpoint: Equatable {
        internal let input: Swift.ArraySlice<Element>
        internal init(_ input: Swift.ArraySlice<Element>) { self.input = input }
        public static func == (lhs: Self, rhs: Self) -> Bool { lhs.input.startIndex == rhs.input.startIndex }
    }
}
