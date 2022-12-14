from src.program import array_sum
from starkware.cairo.common.alloc import alloc

func test_array_sum() {
    const ARRAY_SIZE = 3;

    // Allocate an array.
    let (ptr) = alloc();

    // Populate some values in the array.
    assert [ptr] = 9;
    assert [ptr + 1] = 16;
    assert [ptr + 2] = 25;

    let sum = array_sum(ptr, ARRAY_SIZE);

    assert sum = 50;
    return ();
}

func test_failing_array_sum() {
    %{ expect_revert() %}
    const ARRAY_SIZE = 3;

    // Allocate an array.
    let (ptr) = alloc();

    // Populate some values in the array.
    assert [ptr] = 9;
    assert [ptr + 1] = 16;
    assert [ptr + 2] = 25;

    let sum = array_sum(ptr, ARRAY_SIZE);

    assert sum = 55;
    return ();
}
