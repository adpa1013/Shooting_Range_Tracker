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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shooting Range Tracker',
          key: Key('homeTitle'),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Gallery")),
          // Image(
          //   image: FileImage(
          //     File(gallery.data.value.path),
          //   ),
          // )
        ],
      ),
    );
  }
}
