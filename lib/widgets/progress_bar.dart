import 'package:flutter/material.dart'


    show Alignment, AlwaysStoppedAnimation, CircularProgressIndicator, Colors, Container, EdgeInsets;

circularProgress()
{ return Container(
  alignment: Alignment.center,
  padding:  const EdgeInsets.only(top: 12),
  child: const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(
      Colors.amber,
    ),
  ),
);
}


