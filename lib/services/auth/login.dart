// import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esptracker/services/notfication_service.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final FirebaseFirestore _firestore = FirebaseFirestore.instance;



Future<User?> pars_authentication({required String email, required String password}) async {
  print("auth func call");
  try {
    if (!email.endsWith("@gmail.com")) {
      email = "$email@gmail.com";
    }
    var result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    // authSession().saveSession(result.user.uid, ID)
    var userIdToken = await _auth.currentUser!.getIdToken(); //önemli
    var userIdTokenResult = await _auth.currentUser!.getIdTokenResult(); //önemli
    // _auth.signInWithCredential(credential)
    // await _auth.setPersistence(Persistence.NONE);
    // _auth.currentUser.
    // print(_auth.signInWithCustomToken(token))
    print(await _auth.currentUser!.uid);
    print("***************************************************");
    await add_user_ntf_token(await _auth.currentUser!.uid);

    return result.user;
  } catch (e) {
    print("auth func err");
    print(e.toString());
    return null;
  }
}
Future<void> pars_authentication_log_out()async{
  _auth.signOut();
}

device_has_auth() async {
  return await _auth.currentUser != null;
}

login_save({required String userID}) async{
}

Future<void> add_user_ntf_token(uid) async{



  var data = await _firestore.collection('user').doc(uid).get();
  String token = "pars";
  if (data.get('nfts') != null){
    List <dynamic> nfts = data.get('nfts');
    bool repeat_controller = false;
    nfts.forEach((element) {
      if(token == element){
        repeat_controller = true;
      }
    });
    if (repeat_controller != true){
      nfts.add(token);
      _firestore.collection('user').doc(uid).set({'nfts':nfts});
    }
  }else{
    _firestore.collection('user').doc(uid).set({'nfts':[token]});
  }


}