// import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

Future<User?> pars_authentication({required String email, required String password}) async {
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
    await _auth.setPersistence(Persistence.NONE);
    // _auth.currentUser.
    // print(_auth.signInWithCustomToken(token))

    return result.user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}


device_has_auth() async {
  return await _auth.currentUser != null;
}

login_save({required String userID}) async{

}
