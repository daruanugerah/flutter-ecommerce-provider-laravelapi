import 'package:bwa_ecom_prov/models/product_model.dart';
import 'package:bwa_ecom_prov/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        'isFromUser': true,
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
