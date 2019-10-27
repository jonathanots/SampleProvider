import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleprovider/providers/post_provider.dart';

import 'home.dart';

void main() => 
runApp(
  MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>.value(value: PostProvider(),)
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ), 
  )
);

