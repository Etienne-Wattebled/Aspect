package classes;
import java.util.LinkedList;


public class Clients {
	private LinkedList<Client> clients;
	
	public Clients() {
		this.clients = new LinkedList<Client>();
	}
	
	public boolean addClient(Client c) {
		return this.clients.add(c);
	}
	
	public boolean delClient(Client c) {
		return this.clients.remove(c);
	}
}
