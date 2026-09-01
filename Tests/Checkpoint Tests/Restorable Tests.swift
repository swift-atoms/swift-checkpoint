public import Checkpoint
import Checkpoint_Test_Support
import Testing

@Suite
struct `Restorable Tests` {

    @Test
    func `copyable state gets checkpointing for free`() {
        var state = 41
        let mark = state.checkpoint

        state += 1
        #expect(state == 42)

        state.seek(to: mark)
        #expect(state == 41)
    }

    @Test
    func `seek to current checkpoint is the identity`() {
        var counter = Counter()
        counter.increment()

        #expect(
            RestorableLaws.seekToCurrentIsIdentity(&counter) { $0.count }
        )
    }

    @Test
    func `checkpoint restores across mutation`() {
        var counter = Counter()
        counter.increment()

        #expect(
            RestorableLaws.checkpointRestoresAcrossMutation(
                &counter,
                mutate: { $0.increment() },
                observe: { $0.count }
            )
        )
    }
}

extension Int: Restorable {}

private struct Counter: Restorable {

    private(set) var count = 0

    mutating func increment() {
        count += 1
    }

    var checkpoint: Int {
        count
    }

    mutating func seek(to checkpoint: Int) {
        count = checkpoint
    }
}
