import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:split_it/modules/event_details/widgets/check_rounded_button/check_rounded_button.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/utils/formatters.dart';

class DetailsPersonTile extends StatelessWidget {
  final Function(EventModel newFriend) onChanged;
  final FriendModel friend;
  final EventModel event;

  const DetailsPersonTile({
    Key? key,
    required this.onChanged,
    required this.friend,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10.0),
          image: friend.photoUrl.isNotEmpty
              ? DecorationImage(
                  image: NetworkImage(friend.photoUrl),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: friend.photoUrl.isEmpty ? Text(friend.name[0]) : Container(),
      ),
      title: Text(
        friend.name,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF666666),
        ),
      ),
      subtitle: Text(
        event.value.reais(),
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: friend.paid ? Color(0xFF40B28C) : Color(0xFFE83F5B),
        ),
      ),
      trailing: CheckRoundedButton(
        event: event,
        friend: friend,
        onChanged: onChanged,
      ),
    );
  }
}
