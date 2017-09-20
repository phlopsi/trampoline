shared abstract class Call<out Type>()
		extends Trampoline<Type>() {
	shared actual Type result {
		variable Call<Type> previous = this;
		
		while (true) {
			value current = previous.bounce();
			
			switch (current)
			case (is Return<Anything>) {
				return current.result;
			}
			case (is Call<Anything>) {
				previous = current of Call<Type>;
			}
		}
	}
	
	shared formal Trampoline<Type> bounce();
}
