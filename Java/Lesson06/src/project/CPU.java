package project;

public class CPU {
	public float price;
	public Processor processor;
	public Ram ram;

	public static class Processor {
		public String coreAmount;
		public String menufacturer;
		public cache cache;

		Processor(String coreAmount, String menufacturer, cache cache) {
			this.coreAmount = coreAmount;
			this.menufacturer = menufacturer;
			this.cache = cache;
		}

		public enum cache {
			SAMLL, MEDIUM, LARGE
		}
	}

	public static class Ram {
		public String memory;
		public String menufacturer;
		public float clockSpeed;

		Ram(String memory, String menufacturer, float clockSpeed) {
			this.memory = memory;
			this.menufacturer = menufacturer;
			this.clockSpeed = clockSpeed;
		}
	}

	CPU(float price, Processor processor, Ram ram) {
		this.price = price;
		this.processor = processor;
		this.ram = ram;
	}

	@Override
	public String toString() {
		String result = "";
		result += "Price: " + price + "\n";
		result += "Processor: " + processor + "\n";
		result += "Ram: " + ram;

		return result;
	}

}
