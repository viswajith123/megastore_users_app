import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:megastore_users_app/models/products.dart';
import 'package:megastore_users_app/models/sellers.dart';

import '../assistantMethods/assistant_methods.dart';
import '../global/global.dart';
import '../splashScreen/splash_screen.dart';
import '../widgets/products_designs.dart';
import '../widgets/sellers_design.dart';
import '../widgets/my_drawer.dart';
import '../widgets/progress_bar.dart';
import '../widgets/text_widget_header.dart';


class ProductScreen extends StatefulWidget
{
  final Sellers? model;
  ProductScreen({this.model});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.orange,
                ],
                begin:  FractionalOffset(0.0, 0.0),
                end:  FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()
         {
          clearCartNow(context);

           Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
          },
        ),
        title: const Text(
          "MeaStore",// Text(sharedPreferences!.getString("sellername")!,
          style: TextStyle(  fontSize: 45, fontFamily: "Sinatra"),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,






      //
      //   actions: [
      //     // IconButton(
      //     //      icon: Icon(Icons.shopping_cart,color: Colors.cyan),
      //     //   onPressed: ()
      //     //   {
      //     //      send user to cart screen
      //     //
      //     //   },
      //     // ),
      //     Positioned(
      //         child: Stack(
      //           children: [
      //             const Icon(
      //                 Icons.brightness_1,
      //                 size:20.0,
      //               color: Colors.green,
      //             ),
      //             Positioned(
      //                 child: Stack(
      //                   children: const [
      //                     Icon(
      //                       Icons.brightness_1,
      //                       size: 20,
      //                       color: Colors.green,
      //                     ),
      //                     Positioned(
      //                         top: 3,
      //                         right: 4,
      //
      //                         child: Center(
      //                           child: Text("0", style: TextStyle(color: Colors.white,fontSize: 12),),
      //                         ),
      //                     )],
      //
      //                 ),
      //             )],
      //         ),
      //     ),
      //   ],
       ),
      body: CustomScrollView(
        slivers: [

          SliverPersistentHeader(pinned: true, delegate: TextWidgetHeader(title:  widget.model!.sellerName.toString()+ " Products")),// widget.model!.sellerName.toString()+toString()+" Products")),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("sellers")
                .doc(widget.model!.sellerUID)
                .collection("products")
                .orderBy("publishedDate",descending: true)
                .snapshots(),
            builder: (context, snapshot)
            {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(
                child: Center(child: circularProgress(),),
              )
                  : SliverStaggeredGrid.countBuilder(//(delegate: delegate, gridDelegate: gridDelegate).countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                itemBuilder: (context, index)
                {
                  Products model = Products.fromJson(
                    snapshot.data!.docs[index].data()! as Map<String, dynamic>,
                  );
                  return ProductsDesignWidget(
                    model: model,
                    context: context,
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            },
          ),
        ],
      ),
    );
  }
}



