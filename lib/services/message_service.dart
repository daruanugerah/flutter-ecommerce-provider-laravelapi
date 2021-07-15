import 'package:bwa_ecom_prov/models/message_model.dart';
import 'package:bwa_ecom_prov/models/product_model.dart';
import 'package:bwa_ecom_prov/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessageByUserId({int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map(
        (QuerySnapshot list) {
          var result = list.docs.map<MessageModel>(
            (DocumentSnapshot message) {
              print(message.data());
              return MessageModel.fromJson(message.data());
            },
          ).toList();

          // sorting message by latest in down, longest in above
          result.sort(
            (MessageModel a, MessageModel b) =>
                a.createdAt.compareTo(b.createdAt),
          );

          return result;
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage(
      {UserModel userModel,
      bool isFromUser,
      String message,
      ProductModel productModel}) async {
    try {
      firestore.collection('messages').add({
        'message': message,
        'userId': userModel.id,
        'userName': userModel.name,
        'userImage': userModel.profilePhotoUrl,
        'isFromUser': isFromUser,
        'productModel': productModel is UninitializedProductModel
            ? {}
            : productModel.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('Message has been successfully send!'));
    } catch (e) {
      throw Exception('Message send failed!');
    }
  }
}
