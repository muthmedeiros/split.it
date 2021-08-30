import 'package:flutter/material.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTile extends StatelessWidget {
  final FriendModel data;
  final bool isRemovable;
  final VoidCallback onPressed;

  const PersonTile({
    Key? key,
    required this.data,
    this.isRemovable = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(data.photoUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        data.name,
        style: isRemovable
            ? AppTheme.textStyles.personTileTitleSelected
            : AppTheme.textStyles.personTileTitle,
      ),
      trailing: IconButton(
        icon: isRemovable
            ? Icon(
                Icons.remove,
                color: AppTheme.colors.iconRemove,
              )
            : Icon(
                Icons.add,
                color: AppTheme.colors.iconAdd,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
