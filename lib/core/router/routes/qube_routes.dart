enum QubeRoutes {
  transactions('/transactions'),
  deliveryDetails('/delivery-details');

  final String path;
  const QubeRoutes(this.path);
}
