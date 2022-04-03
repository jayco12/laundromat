import 'package:flutter/material.dart';
import 'package:haysters_laundromat/Database/order_adress.dart';
import 'package:haysters_laundromat/Database/order_database.dart';
import 'package:haysters_laundromat/components/order_database.dart';

const textStyle = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  letterSpacing: 1,
  fontWeight: FontWeight.bold,
);

final inputDecoration = InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2,
        )));

class EditOrderScreen extends StatefulWidget {
  const EditOrderScreen({Key? key}) : super(key: key);

  @override
  State<EditOrderScreen> createState() => _EditOrderScreenState();
}

class _EditOrderScreenState extends State<EditOrderScreen> {
  late Order orderData;
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController salaryController;
  late TextEditingController addressController;
  late TextEditingController traitsController;

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Edit Employee"),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name', style: textStyle),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration:
                          inputDecoration.copyWith(hintText: "Enter your Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Age',
                      style: textStyle,
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration:
                          inputDecoration.copyWith(hintText: "Enter Your Age"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    const Text('Salary', style: textStyle),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: salaryController,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration.copyWith(
                          hintText: "Enter your Salary"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your salary';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Address',
                      style: textStyle,
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration.copyWith(
                          hintText: "street number,house number,City"),
                      validator: (value) {
                        if (value!.isNotEmpty && !value.contains(",")) {
                          return 'Please seperate address by comma';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Traits',
                      style: textStyle,
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: traitsController,
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration.copyWith(
                          hintText: "Enter Employee Traits"),
                      validator: (value) {
                        if (value!.isNotEmpty && !value.contains(",")) {
                          return 'Please seperate traits by comma';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    !isLoading
                        ? Center(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(200, 50)),
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromARGB(255, 83, 80, 80))),
                                onPressed: (() async {
                                  if (_formKey.currentState!.validate()) {
                                    DatabaseService service = DatabaseService();
                                    List<String> orderTraits =
                                        traitsController.text.split(",");
                                    late Address address;
                                    if (addressController.text.contains(",")) {
                                      List<String> fullAddress =
                                          addressController.text.split(",");
                                      address = Address(
                                          streetName: fullAddress[0],
                                          buildingName: fullAddress[1],
                                          cityName: fullAddress[2]);
                                    }
                                    Order order = Order(
                                        id: orderData.id,
                                        name: nameController.text,
                                        age: int.parse(ageController.text),
                                        salary:
                                            int.parse(salaryController.text),
                                        address: address,
                                        orderTraits: orderTraits);
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await service.updateOrder(order);
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }),
                                child: const Text(
                                  "Update",
                                  style: TextStyle(fontSize: 20),
                                )),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )
                  ],
                ),
              )),
        ));
  }

  _initializeControllers() {
    orderData = ModalRoute.of(context)!.settings.arguments as Order;
    String orderTraits = "";
    for (var element in orderData.orderTraits!) {
      orderTraits += "$element,";
    }
    orderTraits = orderTraits.substring(0, orderTraits.lastIndexOf(","));

    nameController = TextEditingController(text: orderData.name);
    ageController = TextEditingController(text: orderData.age.toString());
    salaryController = TextEditingController(text: orderData.salary.toString());
    addressController = TextEditingController(
        text:
            "${orderData.address.streetName},${orderData.address.buildingName},${orderData.address.cityName}");
    traitsController = TextEditingController(text: orderTraits);
  }
}
