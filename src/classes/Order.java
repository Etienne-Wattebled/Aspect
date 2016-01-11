package classes;

public class Order {
	private int id;
	private double amount;
	
	public Order(int id, double amount) {
		this.id = id;
		this.amount = amount;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}

	public void printOrder() {
		System.out.print(id);
		System.out.print(" ");
		System.out.print(amount);
	}
}
