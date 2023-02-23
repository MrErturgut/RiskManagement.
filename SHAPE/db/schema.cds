namespace mhp.capire.carshop;

using
{
    Currency,
    managed,
    sap,
    cuid
}
from '@sap/cds/common';

entity Customer : cuid
{
    firstName : String(100);
    lastName : String(100);
    street : String(100);
    housenumber : String(100);
    postalCode : String(100);
    city : String(100);
    country : String(100);
    email : String(100);
    phone : String(100);
    Orders : Association to many Orders on Orders.Customer = $self;
}

entity Orders : cuid, managed
{
    Items : Composition of many OrderItems on Items.parent = $self;
    Customer : Association to one Customer;
    currency : Currency;
    price : Decimal(9,2);
}

entity OrderItems : cuid
{
    parent : Association to one Orders;
    car : Association to one Cars;
    amount : Integer;
    netAmount : Decimal(9,2);
}

entity Cars : cuid, managed
{
    descr : localized String(1111);
    model : String(100);
    manufacturer : Association to one Manufacturers;
    price : Decimal;
    currency : Currency;
    stock : Integer;
    engineType : Association to one EngineTypes;
    enginePowerKw : Integer;
    enginePowerPS : Integer;
    color : String(30);
    image : LargeBinary;
}

entity Manufacturers : cuid, managed
{
    key ID : UUID;
    name : String(10);
    descr : String(111);
    country : String(3);
    cars : Association to many Cars on cars.manufacturer = $self;
}

entity EngineTypes : sap.common.CodeList
{
    key code : Integer;
    name : String;
}
