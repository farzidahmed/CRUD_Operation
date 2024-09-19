import 'dart:convert';

import 'package:crudoperation/models/productlist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.product});

  final Product product;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}
class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _productNameTeController = TextEditingController();
  final TextEditingController _productUnitPriceController = TextEditingController();
  final TextEditingController _productTotalPriController = TextEditingController();
  final TextEditingController _productCodeController= TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productQuantityCotroller = TextEditingController();
  final GlobalKey<FormState>_globalKey  =GlobalKey<FormState>();

  bool _inprogress = false;

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
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a value";
                  }
                  return null;
                },
                controller: _productNameTeController,
                decoration: const InputDecoration(
                    hintText: "name",
                    labelText: "Product Name"
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a value";
                  }
                  return null;
                },
                controller: _productUnitPriceController,
                decoration: const InputDecoration(
                    hintText: "Unit price",
                    labelText: "Product unit price"
                ),
              ),
              TextFormField(
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a value";
                  }
                  return null;
                },
                controller: _productTotalPriController,
                decoration: const InputDecoration(
                    hintText: "Total price",
                    labelText: "Product total price"
                ),
              ),
              TextFormField(
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a value";
                  }
                  return null;
                },
                controller: _productImageController,
                decoration: const InputDecoration(
                    hintText: "Image",
                    labelText: "Product image"
                ),
              ),
              TextFormField(
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a value";
                  }
                  return null;
                },
                controller: _productCodeController,
                decoration: const InputDecoration(
                    hintText: "Code",
                    labelText: "Product code"
                ),
              ),
              TextFormField(
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "Enter a value";
                  }
                  return null;
                },
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
                  onPressed: _onTapProductButton,
                  child: Text("Add product",style: TextStyle(fontSize: 30),))
            ],
          ),
        ),
      ),
    );
  }

  void _onTapProductButton(){
    if(_globalKey.currentState!.validate()){
      _updateProduct();
    }
  }

  Future<void> _updateProduct() async {
    _inprogress = true;
    setState(() {});
    if (widget.product?.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product ID not found!')),
      );
      return;
    }
    Map<String, String> inputData = {
      "Img": _productImageController.text,
      "ProductCode": _productCodeController.text,
      "ProductName": _productNameTeController.text,
      "Qty": _productQuantityCotroller.text,
      "TotalPrice": _productTotalPriController.text,
      "UnitPrice": _productUnitPriceController.text
    };

    String updateProductUrl =
        'http://164.68.107.70:6060/api/v1/UpdateProduct/6395ce12187245c05d68da82/${widget.product.id}}';
    print('API URL: $updateProductUrl');
    Uri uri = Uri.parse(updateProductUrl);
    Response response = await post(uri,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(inputData));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      print("update data");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product has been updated')),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update product failed! Try again.')),
      );
    }
  }
  void cleartextfiled(){
    _productNameTeController.clear();
    _productUnitPriceController.clear();
    _productTotalPriController.clear();
    _productImageController.clear();
    _productCodeController.clear();
    _productQuantityCotroller.clear();
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
