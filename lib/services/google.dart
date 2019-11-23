import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FBApi {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static FirebaseUser firebaseUser;

  FBApi(FirebaseUser user) {
   firebaseUser = user;
  }

  static Future<FBApi> logOut() async{
    _googleSignIn.signOut();
    print(' ${firebaseUser.displayName} saiu');
  }

  static Future<FBApi> dadosUsuario() async{
    var nomeUser = firebaseUser.displayName;
    var emailUser = firebaseUser.email;
    var photoUser = firebaseUser.photoUrl;
  }

  static Future<FBApi> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    AuthCredential authCredential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    final FirebaseUser user = (await _auth.signInWithCredential(authCredential)).user;
    
    assert(user.email != null);
    assert(user.displayName != null);

    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return FBApi(user);
  }
}