import 'package:flutter/material.dart';

class TimeLineList extends StatelessWidget {
  const TimeLineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Location: '),
            subtitle: Text('15/09/2024 05:30 PM'),
            trailing: Icon(Icons.arrow_outward),
          );
        });
  }
}
