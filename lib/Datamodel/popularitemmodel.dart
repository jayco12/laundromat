class Popularitemmodel {
  String item, price;

  Popularitemmodel({
    required this.item,
    required this.price,
  });
}

List<Popularitemmodel> popularCollection = [
  Popularitemmodel(
    item: "Shirts (without handger)",
    price: "N300",
  ),
  Popularitemmodel(
    item: "Shirts (with handger)",
    price: "N400",
  ),
  Popularitemmodel(
    item: "Trousers/Shirts",
    price: "N400",
  ),
  Popularitemmodel(
    item: "Polo/T-Shirts",
    price: "N250",
  ),
  Popularitemmodel(
    item: "Dress",
    price: "N300",
  ),
  Popularitemmodel(
    item: "Bed Sheets",
    price: "N500",
  ),
];
