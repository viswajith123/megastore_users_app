import 'package:flutter/material.dart';
import 'package:megastore_users_app/global/global.dart';

import '../authentication/auth_screen.dart';

class  MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25,bottom:10),
            child: Column(
              children: [
                //hedder drawer
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding:const EdgeInsets.all(1.0),
                    child: Container (
                      height: 160,
                      width: 160,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          sharedPreferences!.getString("photoUrl")!

                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10,),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "Train"),
                ),
                
              ],
            ),

          ),
          Container(
            padding: const EdgeInsets.only(top: 1.0) ,
            child: Column(
              children:  [
                Divider(
                  height: 19,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.black,),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.black),

                  ),
                  onTap: ()
                  {


                  },


                ),
                ListTile(
                  leading: Icon(Icons.access_time, color: Colors.black,),
                  title: Text(
                    "History",
                    style: TextStyle(color: Colors.black),

                  ),
                  onTap: ()
                  {


                  },


                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.black,),
                  title: Text(
                    "Search",
                    style: TextStyle(color: Colors.black),

                  ),
                  onTap: ()
                  {


                  },

                ),
                ListTile(
                  leading: Icon(Icons.add_location, color: Colors.black,),
                  title: Text(
                    "Add New Address",
                    style: TextStyle(color: Colors.black),

                  ),
                  onTap: ()
                  {


                  },

                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.black,),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black),

                  ),
                  onTap: ()
                  {
                    firebaseAuth.signOut().then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));
                    });

                  },
                ),


              ],
            ),
          )


        ],
      ),
    );
  }
}
