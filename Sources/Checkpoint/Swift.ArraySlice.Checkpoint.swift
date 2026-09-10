extension Swift.ArraySlice {

    public struct Checkpoint: Equatable {
        internal let input: Swift.ArraySlice<Element>
        internal init(_ input: Swift.ArraySlice<Element>) { self.input = input }
        public static func == (lhs: Self, rhs: Self) -> Bool { lhs.input.startIndex == rhs.input.startIndex }
    }
}
