import 'package:flutter/material.dart';
import 'package:megastore_users_app/authentication/register.dart';

import 'login.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("MegaStore",
        style:TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: "Bold",
        )),

        centerTitle: true,
        bottom: const TabBar(
            tabs:[
              Tab(
            icon:Icon(Icons.lock,color:Colors.white,),
                text: "Login",
            ),
              Tab(
             icon:Icon(Icons.lock,color:Colors.white,),
             text: "Register",
            ),
            ],
          indicatorColor: Colors.white38,
          indicatorWeight: 6,
        ),
      ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
              colors:[
                Colors.white12,
                Colors.white10,

              ],
            )
          ),
          child: const TabBarView(
            children: [
              LoginScreen(),
              RegisterScreen(),

            ],


        ),

        ),
        ),



    );
  }
}

