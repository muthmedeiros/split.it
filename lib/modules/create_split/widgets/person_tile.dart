import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  final String name;
  final bool isRemovable;

  const PersonTile({
    Key? key,
    required this.name,
    this.isRemovable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        color: Colors.grey.shade300,
      ),
      title: Text(name),
      trailing: IconButton(
        icon: isRemovable ? Icon(Icons.remove) : Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
