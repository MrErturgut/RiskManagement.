using { mhp.capire.carshop as my } from '../db/schema';

@path : 'service/admin'

service AdminService {

  entity Cars as projection on  my.Cars;

  entity Orders as select from my.Orders;
  
  entity Manufacturers as projection on my.Manufacturers;

  entity OrderItems as select from my.OrderItems;

}