class Customer {
  String id;
  String name;

  Customer(this.id, this.name);
}

class Contacts {
  String phone;
  String email;

  Contacts(this.phone, this.email);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}
