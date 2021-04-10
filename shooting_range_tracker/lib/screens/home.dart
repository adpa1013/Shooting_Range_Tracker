import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shooting_range_tracker/providers/img_provider.dart';

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final images = useProvider(imagesProvider.state);
    final imagesProv = useProvider(imagesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shooting Range Tracker',
          key: Key('homeTitle'),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await imagesProv.addImage(choice: 'gallery');
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text("Gallery")),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List<Widget>.generate(images.length, (index) {
                return InkWell(
                  onTap: () {},
                  child: images[index],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
