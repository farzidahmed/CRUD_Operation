import 'package:flutter/material.dart';

class AddProductItem extends StatefulWidget {
  const AddProductItem({super.key});

  @override
  State<AddProductItem> createState() => _AddProductItemState();
}
class _AddProductItemState extends State<AddProductItem> {
  final TextEditingController _productNameTeController = TextEditingController();
  final TextEditingController _productUnitPriceController = TextEditingController();
  final TextEditingController _productTotalPriController = TextEditingController();
  final TextEditingController _productCodeController= TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productQuantityCotroller = TextEditingController();
  final GlobalKey<FormState>_globalKey  =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add product Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productNameTeController,
                decoration: const InputDecoration(
                  hintText: "name",
                  labelText: "Product Name"
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                controller: _productUnitPriceController,
              decoration: const InputDecoration(
              hintText: "Unit price",
              labelText: "Product unit price"
              ),
              ),
              TextFormField(
                controller: _productTotalPriController,
                decoration: const InputDecoration(
                    hintText: "Total price",
                    labelText: "Product total price"
                ),
              ),
              TextFormField(
                controller: _productImageController,
                decoration: const InputDecoration(
                    hintText: "Image",
                    labelText: "Product image"
                ),
              ),
              TextFormField(
                controller: _productCodeController,
                decoration: const InputDecoration(
                    hintText: "Code",
                    labelText: "Product code"
                ),
              ),
              TextFormField(
                controller: _productQuantityCotroller,
                decoration: const InputDecoration(
                    hintText: "Quantity",
                    labelText: "Product quantity"
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70
                  ),
                  onPressed: (){},
                  child: Text("Update",style: TextStyle(fontSize: 30),))
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _productNameTeController;
    _productUnitPriceController;
    _productTotalPriController;
    _productImageController;
    _productCodeController;
    _productQuantityCotroller;
    super.dispose();
  }
}
