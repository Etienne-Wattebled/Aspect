package classes;
import java.util.LinkedList;


public class Orders {
	
	private LinkedList<Order> orders;
	
	public Orders() {
		this.orders = new LinkedList<Order>();
	}
	
	public boolean addOrder(Order o) {
		return this.orders.add(o);
	}
	
	public boolean delOrder(Order o) {
		return this.orders.remove(o);
	}

	public boolean containsOrder(Order order) {
		return orders.contains(order);
	}
}
