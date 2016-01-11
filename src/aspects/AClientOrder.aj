package aspects;

import java.util.LinkedList;
import java.util.List;

import classes.Client;
import classes.Order;

public aspect AClientOrder {
	// ORDER
	private Client Order.client;
	
	pointcut printOrder() : execution (public void Order.printOrder());
	
	public Order.new(Client c,int i, double a) {
		this(i,a);
		this.client = c;
	}
	
	/**
	 * Change the client for this order.
	 * client.delOrder(order) for the client before is called.
	 * client.addOrder(order) is automatically called.
	 * @param client new client
	 */
	public boolean Order.setClient(Client c) {
		boolean first = true;
		if (this.client != null) {
			first = this.client.delOrder(this);
		}
		this.client = c;
		return client.addOrder(this) && first;
	}
	
	public Client Order.getClient() {
		return this.client;
	}
	
	void around() : printOrder() {
		proceed();
		System.out.println(" ");
		Order o = (Order) (thisJoinPoint.getThis());
		System.out.println(o.getClient().getName());
	}
	
	// CLIENT
	private List<Order> Client.orders = new LinkedList<Order>();
	
	public List<Order> Client.getOrders() {
		return this.orders;
	}
	
	/**
	 * This method add an order for this client. 
	 * /!\ This order must to be on Orders and order.setClient(client) is not called /!\
	 * You can use order.setClient(client) in order to update all automatically.
	 * @param order
	 * @return
	 */
	public boolean Client.addOrder(Order o) {
		if (o.getOrders().containsOrder(o)) {
			return false;
		} else {
			return orders.add(o);
		}
	}
	/**
	 * Delete the order for this client. /!\ Doesn't remove the Order on Orders /!\
	 * @param order
	 * @return
	 */
	public boolean Client.delOrder(Order order) {
		return this.orders.remove(order);
	}
	
	public boolean Client.hasOrder() {
		return !this.orders.isEmpty();
	}	
	
	public boolean Client.hasOrder(Order order) {
		return this.orders.contains(order);
	}
}
