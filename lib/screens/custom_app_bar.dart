import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/user.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final Color backgroundColor;
  const CustomAppBar({
    Key key,
    this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<List<ModelUser>>(context);

    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      title: Text('title'),
      centerTitle: true,
      elevation: 5,

      actions: <Widget>[
        (prov[1].isSubscribed != false)
            //  _isVerified
            ? Row(
            children: <Widget>[
              Text(' Verfied'),
              IconButton(
                icon: Icon(Icons.verified,
                  color: Colors.amber,
                  size: 40,),
                onPressed: () => null,
              ), ] )
            : Row(
            children: [
              Text('Not Subscribed'),
              IconButton(
                icon: Icon(Icons.verified_user_rounded,
                  color: Colors.grey[500],
                  size: 40,),
                onPressed: () => null,
              ),
            ]
        )
      ],    );
  }
}