//   import 'package:cloud_firestore/cloud_firestore.dart';
//   import 'package:flutter/material.dart';
//   import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//   import 'package:megastore_users_app/models/items.dart';
//   import 'package:megastore_users_app/models/sellers.dart';/////////////////////error
//   import 'package:megastore_users_app/models/products.dart';
// import 'package:megastore_users_app/widgets/app_bar.dart';
//   import 'package:megastore_users_app/widgets/items_design.dart';
//
//   import '../global/global.dart';
//   import '../widgets/products_designs.dart';
//
//
// import '../widgets/sellers_design.dart';
//   import '../widgets/my_drawer.dart';
//   import '../widgets/progress_bar.dart';
//   import '../widgets/text_widget_header.dart';
//
//   class ItemsScreen extends StatefulWidget
//   {
// //
// //final Sellers? model;
//     final Products? model;
//     ItemsScreen({this.model});
//
//
//     @override
//     _ItemsScreenState createState() => _ItemsScreenState();
//   }
//
//   class _ItemsScreenState extends State<ItemsScreen> {
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.orange,
//                     Colors.orange,
//                   ],
//                   begin:  FractionalOffset(0.0, 0.0),
//                   end:  FractionalOffset(1.0, 0.0),
//                   stops: [0.0, 1.0],
//                   tileMode: TileMode.clamp,
//                 )
//             ),
//           ),
//           title: Text(
//             sharedPreferences!.getString("name")!,
//             style: const TextStyle(fontSize: 30, fontFamily: "Lobster"),
//           ),
//           centerTitle: true,
//           automaticallyImplyLeading: true,
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.library_add, color: Colors.cyan,),
//               onPressed: ()
//               {
//                 //Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsUploadScreen(model: widget.model)));
//               },
//             ),
//           ],
//         ),
//         drawer: MyDrawer(),
//
//          body: CustomScrollView(
//          slivers: [
//
//            SliverPersistentHeader(pinned: true, delegate: TextWidgetHeader(title: "Items  " )),//+ widget.model!.productTitle.toString()+"'s Products"
//            StreamBuilder<QuerySnapshot>(
//              stream: FirebaseFirestore.instance
//                   .collection("sellers")
//                   .doc(widget.model!.sellerUID)
//                   .collection("products")
//                   .doc(widget.model!.productID)
//                   .collection("items")
//
//                   .orderBy("publishedDate",descending: true)
//                   .snapshots(),
//             builder: (context, snapshot) {
//               return !snapshot.hasData ?
//               SliverToBoxAdapter(child: Center(child: circularProgress(),),)
//                   : SliverStaggeredGrid.countBuilder( //(delegate: delegate, gridDelegate: gridDelegate).countBuilder(
//                       crossAxisCount: 1,
//                       staggeredTileBuilder: (c) =>  StaggeredTile.fit(1) ,
//                       itemBuilder: (context, index)
//                       {
//                       Items model= Items.fromJson(
//                         snapshot.data!.docs[index].data()! as Map<String, dynamic>,);
//                       return ItemsDesignWidget(
//                      model:  model,
//                      context: context,
//                     );
//                     },
//                   itemCount: snapshot.data!.docs.length,
//               );
//               },
//             ),
//          ],
//        ),
//        );
//     }
//   }
//
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:megastore_users_app/models/products.dart';
import 'package:megastore_users_app/models/sellers.dart';

import '../global/global.dart';
import '../models/items.dart';
import '../widgets/app_bar.dart';
import '../widgets/items_design.dart';
import '../widgets/products_designs.dart';
import '../widgets/sellers_design.dart';
import '../widgets/my_drawer.dart';
import '../widgets/progress_bar.dart';
import '../widgets/text_widget_header.dart';


class ItemsScreen extends StatefulWidget
   {
//
//final Sellers? model;
    final Products? model;
    ItemsScreen({this.model});


    @override
    _ItemsScreenState createState() => _ItemsScreenState();
  }

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),//sellerUID: widget.model!.sellerUID),
      body: CustomScrollView(
        slivers: [

          SliverPersistentHeader(pinned: true, delegate: TextWidgetHeader(title:  widget.model!.productID.toString()+ " Products")),// widget.model!.sellerName.toString()+toString()+" Products")),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                // .collection("sellers")
                // .doc(widget.model!.sellerUID)
                //  .collection("products")
                // .doc(widget.model!.productID)
                .collection("items")
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
                  Items model = Items.fromJson(
                    snapshot.data!.docs[index].data()! as Map<String, dynamic>,
                  );
                  return  ItemsDesignWidget(
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

