import 'package:crudoperation/global_widgets/product_iten.dart';
import 'package:flutter/material.dart';

import 'add_product_item.dart';

class ProductTills extends StatefulWidget {
  const ProductTills({super.key});

  @override
  State<ProductTills> createState() => _ProductTillsState();
}

class _ProductTillsState extends State<ProductTills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text ("Product tills"),
      ),
      body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context,index) {
            return ProductIten();
          },
        separatorBuilder: (context,index){
            return SizedBox(height: 5,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductItem()),
          );
        },
        child: Icon(Icons.add),

    ),
    );
  }
}
