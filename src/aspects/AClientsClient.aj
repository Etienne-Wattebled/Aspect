package aspects;

import classes.Client;
import classes.Clients;

public aspect AClientsClient {
	// CLIENTS
	pointcut delClient(): execution (public void Clients.delClient(Client));
	
	/**
	 * 
	 * @return false if the client can not be deleted (client still has orders)
	 */
	boolean around(): delClient() {
		Client client = (Client) (thisJoinPoint.getArgs()[0]);
		if (client.hasOrder()) {
			return false;
		} else {
			return (boolean) (proceed());
		}
	}
	
	// CLIENT
	private Clients Client.clients;
	
	public Clients Client.getClients() {
		return this.clients;
	}
	
	public Client.new(Clients c, String n, String a) {
		this(n,a);
		this.clients = c;
	}
}
