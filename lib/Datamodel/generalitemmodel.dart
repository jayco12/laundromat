class Generalitemmodel {
  String item, price;

  Generalitemmodel({
    required this.item,
    required this.price,
  });
}

List<Generalitemmodel> generalCollection = [
  Generalitemmodel(
    item: "Hoodie/Cardigan",
    price: "N500",
  ),
  Generalitemmodel(
    item: "Jalamia/Pajamas",
    price: "N400",
  ),
  Generalitemmodel(
    item: "Jacket (Jean/Leather)",
    price: "N400/N500",
  ),
  Generalitemmodel(
    item: "Undies",
    price: "N200",
  ),
  Generalitemmodel(
    item: "Bed Sheets",
    price: "N500",
  ),
  Generalitemmodel(
    item: "Duvet",
    price: "N1000",
  ),
  Generalitemmodel(
    item: "Curtain (Light/Heavy)",
    price: "N500/N800",
  ),
  Generalitemmodel(
    item: "Native Attire (3 pieces)",
    price: "N1500",
  ),
  Generalitemmodel(
    item: "Towel (Small/Big)",
    price: "N500/N700",
  ),
];
