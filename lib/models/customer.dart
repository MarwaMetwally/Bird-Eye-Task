class Customer {
  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;

  String? customerGuid;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  int? languageId;
  int? currencyId;
  String? dateOfBirth;
  String? gender;

  bool? isTaxExempt;
  bool? hasShoppingCartItems;
  bool? active;
  bool? deleted;
  bool? isSystemAccount;

  String? lastIpAddress;
  String? createdOnUtc;
  String? lastLoginDateUtc;
  String? lastActivityDateUtc;
  int? registeredInStoreId;
  bool? subscribedToNewsletter;

  int? id;

  Customer(
      {this.billingAddress,
      this.shippingAddress,
      this.customerGuid,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.languageId,
      this.currencyId,
      this.dateOfBirth,
      this.gender,
      this.isTaxExempt,
      this.hasShoppingCartItems,
      this.active,
      this.deleted,
      this.isSystemAccount,
      this.lastIpAddress,
      this.createdOnUtc,
      this.lastLoginDateUtc,
      this.lastActivityDateUtc,
      this.registeredInStoreId,
      this.subscribedToNewsletter,
      this.id});

  Customer.fromJson(Map<String, dynamic> json) {
    billingAddress = json['billing_address'] != null
        ? BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? BillingAddress.fromJson(json['shipping_address'])
        : null;

    customerGuid = json['customer_guid'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    languageId = json['language_id'];
    currencyId = json['currency_id'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];

    isTaxExempt = json['is_tax_exempt'];
    hasShoppingCartItems = json['has_shopping_cart_items'];
    active = json['active'];
    deleted = json['deleted'];
    isSystemAccount = json['is_system_account'];

    lastIpAddress = json['last_ip_address'];
    createdOnUtc = json['created_on_utc'];
    lastLoginDateUtc = json['last_login_date_utc'];
    lastActivityDateUtc = json['last_activity_date_utc'];
    registeredInStoreId = json['registered_in_store_id'];
    subscribedToNewsletter = json['subscribed_to_newsletter'];

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (billingAddress != null) {
      data['billing_address'] = billingAddress!.toJson();
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }

    data['customer_guid'] = customerGuid;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['language_id'] = languageId;
    data['currency_id'] = currencyId;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;

    data['is_tax_exempt'] = isTaxExempt;
    data['has_shopping_cart_items'] = hasShoppingCartItems;
    data['active'] = active;
    data['deleted'] = deleted;
    data['is_system_account'] = isSystemAccount;

    data['last_ip_address'] = lastIpAddress;
    data['created_on_utc'] = createdOnUtc;
    data['last_login_date_utc'] = lastLoginDateUtc;
    data['last_activity_date_utc'] = lastActivityDateUtc;
    data['registered_in_store_id'] = registeredInStoreId;
    data['subscribed_to_newsletter'] = subscribedToNewsletter;

    data['id'] = id;
    return data;
  }
}

class BillingAddress {
  String? firstName;
  String? lastName;
  String? email;
  String? company;
  int? countryId;

  int? stateProvinceId;
  String? city;
  String? address1;

  String? zipPostalCode;
  String? phoneNumber;

  String? customerAttributes;
  String? createdOnUtc;

  int? id;

  BillingAddress(
      {this.firstName,
      this.lastName,
      this.email,
      this.company,
      this.countryId,
      this.stateProvinceId,
      this.city,
      this.address1,
      this.zipPostalCode,
      this.phoneNumber,
      this.customerAttributes,
      this.createdOnUtc,
      this.id});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    company = json['company'];
    countryId = json['country_id'];

    stateProvinceId = json['state_province_id'];
    city = json['city'];
    address1 = json['address1'];

    zipPostalCode = json['zip_postal_code'];
    phoneNumber = json['phone_number'];

    customerAttributes = json['customer_attributes'];
    createdOnUtc = json['created_on_utc'];

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['company'] = company;
    data['country_id'] = countryId;

    data['state_province_id'] = stateProvinceId;
    data['city'] = city;
    data['address1'] = address1;

    data['zip_postal_code'] = zipPostalCode;
    data['phone_number'] = phoneNumber;

    data['customer_attributes'] = customerAttributes;
    data['created_on_utc'] = createdOnUtc;

    data['id'] = id;
    return data;
  }
}
