package aspects;

import classes.Orders;
import classes.Order;

public aspect AOrdersOrder {
	// ORDER
	private Orders Order.orders;
	
	public Order.new(Orders orders, int id, double amount) {
		this(id,amount);
		this.orders = orders;
	}
	
	public Orders Order.getOrders() {
		return this.orders;
	}
}
