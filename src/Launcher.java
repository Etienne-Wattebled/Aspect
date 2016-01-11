import classes.Client;
import classes.Clients;
import classes.Order;
import classes.Orders;

public class Launcher {
	public static void main(String args[]) {
		Orders orders = new Orders();
		Clients clients = new Clients();
		
		Client c1 = new Client(clients,"Julie","Rue du Moulin");
		
		System.out.println("Client sans order, appel de hasOrder: " + c1.hasOrder());
		
		Order o1 = new Order(orders,c1,0,100.0);
		System.out.println(o1.getClient().getName());
		
		c1.addOrder(o1);
		System.out.println("Client avec order, appel de hasOrder : " + c1.hasOrder());
		System.out.print("\n");
		
		Client c2 = new Client(clients,"Sophie","Rue Arthur");
		
		System.out.println("Avant changement client de Julie à Sophia sur Order : " + o1.getClient().getName());
		o1.setClient(c2);
		
		System.out.println("Changement client de Julie à Sophie sur Order : " + o1.getClient().getName());
		System.out.println("Ce qui fait que, hasOrder sur Julie doit renvoyer false : " + c1.hasOrder());
		
		System.out.print("\n");
		System.out.println("Julie ne peut pas être supprimée : " + clients.delClient(c2));
		
		clients.delClient(c2);
		
		System.out.print("Sauf si elle n'a plus aucun Order : " + clients.delClient(c2));
	}
}
