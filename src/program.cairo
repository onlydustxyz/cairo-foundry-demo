from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

func array_sum(arr: felt*, size) -> felt {
    if (size == 0) {
        return (0);
    }
    let partial_sum = array_sum(arr + 1, size - 1);
    return (arr[0] + partial_sum);
}
