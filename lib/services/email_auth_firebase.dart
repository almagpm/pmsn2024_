import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthFirebase{
  // instancia Firebase auth
  final auth =  FirebaseAuth.instance;

  //Metodo para dar de alta usuario
  Future<bool> signUpUser(
    {required String name, 
    required String password, 
    required String email}) async{
      try{
        final userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          userCredential.user!.sendEmailVerification();
          return true;
        }
        return false;
      }catch (e){
        return false;

      }
    }
    Future<bool> signInUser ({required String password, 
    required String email}) async {
      var band = false;
      final userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        if(userCredential.user!.emailVerified ){
          band = true;
        }
        
      }
      return band;
    }
}