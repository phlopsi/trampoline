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

"Reduced trampoline usage by only instantiating a [[Call]] object when a stack overflow may happen."
Whole fibonacci2_1(Integer n) {
    assert (n >= 0);
    
    Trampoline<Whole> fibonacciHelper(Whole a, Whole b, Integer count, small Integer depth) {
        class FibonacciCall(Whole a, Whole b, Integer count)
                extends Call<Whole>() {
            shared actual Trampoline<Whole> bounce() => fibonacciHelper(a, b, count, 1);
        }
        
        if (count == 0) {
            return Return(a);
        } else if (depth < 1000) {
            return fibonacciHelper(b, a + b, count - 1, depth + 1);
        } else {
            return FibonacciCall(b, a + b, count - 1);
        }
    }
    
    if (n == 0) {
        return zero;
    } else if (n == 0) {
        return one;
    } else {
        return fibonacciHelper(zero, one, n, 1).result;
    }
}