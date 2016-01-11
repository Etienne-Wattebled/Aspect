package aspects;

import classes.Client;
import classes.Clients;

public aspect AClientsClient {
	// CLIENTS
	pointcut delClient(): call (public void Clients.delClient(Client));
	
	/**
	 * 
	 * @return false if the client can not be deleted (client still has orders)
	 */
	boolean around() : delClient() {
		Client client = (Client) (thisJoinPoint.getArgs()[0]);
		if (client.hasOrder()) {
			return false;
		} else {
			return proceed();
		}
	}	
	
	// CLIENT
	private Clients Client.clients;
	
	public Client.new(Clients clients, String name, String address) {
		this(name,address);
		this.clients = clients;
	}
}
