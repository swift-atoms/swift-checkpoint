extension Swift.ArraySlice: Restorable {
    public var checkpoint: Checkpoint { Checkpoint(self) }
    public mutating func seek(to checkpoint: Checkpoint) { self = checkpoint.input }
}
