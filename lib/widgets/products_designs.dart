import 'package:flutter/material.dart';
import 'package:megastore_users_app/models/products.dart';

import '../mainScreens/items_screen.dart';
import '../models/sellers.dart';

class ProductsDesignWidget extends StatefulWidget
{
  Products? model;
  BuildContext? context;

  ProductsDesignWidget({this.model, this.context});

  @override
  _ProductsDesignWidgetState createState() => _ProductsDesignWidgetState();
}



class _ProductsDesignWidgetState extends State<ProductsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsScreen(model: widget.model)));
    },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 1.0,),
              Text(
                widget.model!.productTitle!,
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontFamily: "Train",
                ),
              ),
              Text(
                widget.model!.productTitle!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
