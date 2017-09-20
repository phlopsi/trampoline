import ceylon.math.whole {
    Whole,
    zero,
    one
}

import phlopsi.trampoline.base {
    Trampoline,
    Return,
    Call
}

Whole fibonacci1_0(Integer n) {
    assert (n >= 0);
    
    Trampoline<Whole> fibonacciHelper(Whole a, Whole b, Integer count) {
        if (count == 0) {
            return Return(a);
        } else {
            return object extends Call<Whole>() {
                shared actual Trampoline<Whole> bounce() => fibonacciHelper(b, a + b, count - 1);
            };
        }
    }
    
    if (n == 0) {
        return zero;
    } else if (n == 0) {
        return one;
    } else {
        return fibonacciHelper(zero, one, n).result;
    }
}
