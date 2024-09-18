import 'package:flutter/material.dart';

class ProductIten extends StatefulWidget {
  const ProductIten({super.key});

  @override
  State<ProductIten> createState() => _ProductItenState();
}

class _ProductItenState extends State<ProductIten> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("Product titel"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product Code: code"),
            Text("product Price:\$ 120"),
            Text("Quantity :2"),
            Text("Total price :\$120"),
            Divider(),
            ButtonBar(
              children: [
                TextButton.icon(onPressed: (){},
                  icon: Icon(Icons.edit),
                  label: Text("Edit"),),
                TextButton.icon(onPressed: (){},
                  icon: Icon(Icons.delete),
                  label: Text("Delete",style: TextStyle(color: Colors.red),),),

              ],
            )

          ],
        ),

      ),
    );
  }
}
