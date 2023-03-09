import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_patternnbloc/views/home_view.dart';

import '../model/post_model.dart';

Widget viewOfHome(List<Post> items,bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return itemOfPost(items[index]);
        },
      ),
      (isLoading) ?
          const Center(
            child: CircularProgressIndicator(),
          ) : const SizedBox(),
    ],
  );
}