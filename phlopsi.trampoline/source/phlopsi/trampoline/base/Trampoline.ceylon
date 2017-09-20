shared abstract class Trampoline<out Type>()
        of Return<Type> | Call<Type> {
    shared formal Type result;
}