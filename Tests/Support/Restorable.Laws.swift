public import Checkpoint

public enum RestorableLaws {

    @inlinable
    public static func seekToCurrentIsIdentity<S: Restorable & ~Copyable, O: Equatable>(
        _ state: inout S,
        observe: (borrowing S) -> O
    ) -> Bool {
        let before = observe(state)
        let mark = state.checkpoint
        state.seek(to: mark)
        return observe(state) == before
    }

    @inlinable
    public static func checkpointRestoresAcrossMutation<S: Restorable & ~Copyable, O: Equatable>(
        _ state: inout S,
        mutate: (inout S) -> Void,
        observe: (borrowing S) -> O
    ) -> Bool {
        let before = observe(state)
        let mark = state.checkpoint
        mutate(&state)
        state.seek(to: mark)
        return observe(state) == before
    }
}
