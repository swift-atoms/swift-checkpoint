# swift-checkpoint

Use this package when a mutable value has to be saved and later put back: a parser that tries one reading and rewinds, or a state machine that undoes a step. Start from `Restorable`. A copyable type whose checkpoint is itself conforms with an empty extension, and `Swift.ArraySlice` and `Swift.Substring` already conform. To check a conformance, use `RestorableLaws` from the test support library. If you also iterate the value, use swift-cursor instead, which builds on `Restorable`.

## Laws

- Every conformer must satisfy `RestorableLaws`. Seeking to the current checkpoint changes nothing observable. Seeking to a checkpoint taken before any mutation restores what was observable when it was taken.
- When `Restorable.Checkpoint` is `Self`, the checkpoint is a full copy of the value, and seeking replaces the whole value with that copy.
- A `Swift.ArraySlice.Checkpoint` or `Swift.Substring.Checkpoint` is a snapshot of the whole slice, bounds and contents. Seeking replaces the current slice with it, even if the slice was reassigned in between.
- Two `Swift.ArraySlice.Checkpoint` or `Swift.Substring.Checkpoint` values are equal when their start indices are equal, whatever their contents, end index or source.
