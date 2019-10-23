import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 450,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),

          ),
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: (){},
              )
            ],
          ),
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(loadedProduct.title, style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10.0),
                  Text(loadedProduct.description, style: TextStyle(
                      fontSize: 16.0
                  ),),

                  SizedBox(height: 20.0),

                  Row(
                    children: <Widget>[
                      Spacer(),
                      Text('\$${loadedProduct.price}',style: TextStyle(
                          fontSize: 16.0
                      ),),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        color: Colors.pink.shade200,
                        textColor: Colors.white,
                        child: Text("Add to Cart"),
                        onPressed: (){

                        },
                      )
                  ),
                  SizedBox(height: .0),
                  Center(child: Icon(Icons.keyboard_arrow_down)),
                  Center(child: Text("more items", style: TextStyle(
                      color: Colors.pink.shade300
                  ),),),
                  
                ],
              ),
            ),
          ),
          Positioned(
            top: 365,
            right: 40,
            child: CircleAvatar(
                radius: 20.0,
                foregroundColor: Colors.grey,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.favorite_border)),
          )
        ],
      ),
    );
  }
}
