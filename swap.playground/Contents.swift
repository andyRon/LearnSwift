/**
 
 交换方法
 
 */
func swap<T>(_ array: inout [T],  _ p: Int, _ q: Int) {
    assert(p >= 0 && p < array.count)
    assert(q >= 0 && q < array.count)
    
    (array[p], array[q]) = (array[q], array[p])
}

var arr = [23, 43, 56]

swap(&arr, 0, 1)

