package aspects;

import classes.Client;
import classes.Orders;
import classes.Order;

public aspect AOrdersOrder {
	// ORDER
	private Orders Order.orders;
	private Client Order.client;
	
	public Order.new(Orders o, Client c, int i, double a) {
		this(i,a);
		this.orders = o;
		this.client = c;
	}
	
	public Orders Order.getOrders() {
		return this.orders;
	}
}
