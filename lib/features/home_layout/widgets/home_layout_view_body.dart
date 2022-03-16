import 'package:encryption_9_3/core/constants/strings.dart';
import 'package:encryption_9_3/core/widgets/space.dart';
import 'package:encryption_9_3/features/home_layout/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class HomeLayoutViewBody extends StatelessWidget {
  const HomeLayoutViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kmMainColor,
        centerTitle: true,
        title: const Text(appTitle),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const VerticalSpace(
              value: 2,
            ),
            CustomListView(
              encryptionMethods: encryptionMethods,
            )
          ],
        ),
      ),
    );
  }
}
