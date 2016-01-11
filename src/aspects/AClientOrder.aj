package aspects;

import java.util.LinkedList;
import java.util.List;

import classes.Client;
import classes.Order;

public aspect AClientOrder {
	// ORDER
	private Client Order.client;
	
	pointcut printOrder() : execution (public void Order.printOrder());
	
	public Order.new(int id, double amount,Client client) {
		this(id,amount);
		this.client = client;
	}
	
	/**
	 * Change the client for this order. All is automatically updated
	 * @param client new client
	 */
	public boolean Order.setClient(Client client) {
		boolean a = this.getClient().delOrder(this);
		this.client = client;
		return client.addOrder(this) && a;
	}
	
	public Client Order.getClient() {
		return this.client;
	}
	
	void around() : printOrder() {
		proceed();
		System.out.println(" ");
		System.out.println((Order)(thisJoinPoint.getThis()).getClient().getName());
	}
	
	
	// CLIENT
	private List<Order> Client.orders = new LinkedList<Order>();
	
	public List<Order> Client.getOrders() {
		return this.orders;
	}
	/**
	 * This method add an order for this client. This order must to be on Orders /!\
	 * @param order
	 * @return
	 */
	public boolean Client.addOrder(Order order) {
		if (order.getOrders().containsOrder(order)) {
			return false;
		} else {
			// order.setClient(this) will do this.setOrder(order)
			return order.setClient(this);
		}
	}
	/**
	 * Delete the order for this client. The order is automatically deleted on Orders
	 * @param order
	 * @return
	 */
	public boolean Client.delOrder(Order order) {
		return this.orders.remove(order) && order.getOrders().delOrder(order);
	}
	
	public boolean Client.hasOrder() {
		return !this.orders.isEmpty();
	}	
	
	public boolean Client.hasOrder(Order order) {
		return this.orders.contains(order);
	}
}
