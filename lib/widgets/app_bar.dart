import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:megastore_users_app/main.dart';

import '../assistantMethods/cart_Item_counter.dart';
import '../mainScreens/cart_screen.dart';



class MyAppBar extends StatefulWidget with PreferredSizeWidget
{
  final PreferredSizeWidget? bottom;
  final String? sellerUID;
  MyAppBar({this.bottom,this.sellerUID});

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => bottom==null?Size(56, AppBar().preferredSize.height):Size(56, 80+AppBar().preferredSize.height);
}

class _MyAppBarState extends State<MyAppBar>
{
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          Navigator.pop(context);
        },
      ),
      title: const Text(
        "Megastore",
        style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.cyan,),
              onPressed: ()
              {

                Navigator.push(context, MaterialPageRoute(builder: (c)=> CartScreen(sellerUID: widget.sellerUID)));
              //send user to cart screen
              },
            ),
            Positioned(
              child: Stack(
                children: [
                   Icon(
                    Icons.brightness_1,
                    size: 20.0,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: 3,
                    right: 4,
                     child: Center(

                       child: Consumer<CartItemCounter>(
                        builder: (context, counter, c)
                        {
                           return Text(
                            counter.count.toString(),
                             style: const TextStyle(color: Colors.white, fontSize: 12),
                           );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}




//                        child: Text("0", style: TextStyle(color: Colors.white, fontSize: 12),),
//                      ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
