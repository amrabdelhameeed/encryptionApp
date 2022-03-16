import 'package:encryption_9_3/core/widgets/space.dart';
import 'package:encryption_9_3/features/home_layout/data/models/button_model.dart';
import 'package:encryption_9_3/features/home_layout/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key, this.encryptionMethods}) : super(key: key);
  final List<ButtonModel>? encryptionMethods;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return CustomListViewItem(
          model: encryptionMethods![index],
        );
      },
      separatorBuilder: (context, _) {
        return const VerticalSpace(
          value: 1,
        );
      },
      itemCount: encryptionMethods!.length,
      shrinkWrap: true,
    );
  }
}
