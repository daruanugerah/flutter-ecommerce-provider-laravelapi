import 'package:bwa_ecom_prov/models/message_model.dart';
import 'package:bwa_ecom_prov/providers/auth_provider.dart';
import 'package:bwa_ecom_prov/services/message_service.dart';
import 'package:bwa_ecom_prov/theme.dart';
import 'package:bwa_ecom_prov/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_headset.png',
                width: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Oops, no message yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'You have never done a transaction',
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessageByUserId(userId: authProvider.userModel.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // if you never do chat
              if (snapshot.data.length == 0) {
                return emptyChat();
              }

              // if you after chat
              return Expanded(
                child: Container(
                  color: backgroundColor3,
                  width: double.infinity,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    children: [
                      // show last chat
                      ChatTile(
                        snapshot.data[snapshot.data.length - 1],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: emptyChat(),
              );
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
