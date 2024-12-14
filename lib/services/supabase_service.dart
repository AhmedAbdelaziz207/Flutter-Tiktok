import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  // Signup with email and password

  Future<AuthResponse> signupWithEmailAndPassword(
      {String? email, String? password}) async {
    return await supabase.auth.signUp(
      password: password!,
      email: email!,
    );
  }

  // Login with email and password

  Future<AuthResponse> loginWithEmailAndPassword(
      {String? email, String? password}) async {
    return await supabase.auth.signInWithPassword(
      password: password!,
      email: email!,
    );
  }

  // Sign out

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  // Check if user is signed in

  Future<bool> isSignedIn() async {
    return supabase.auth.currentSession != null;
  }

  // upload image
  Future<String> uploadProfileImage(String path) async {
    return await supabase.storage.from('images').upload(path, File(path));
  }

  // save user credentials

  Future<void> saveUserCredentials(
      {String? email, String? userName, String? userId,String? imageUrl}) async {
    await supabase.from('users').insert({
      'email': email,
      'user_name': userName,
      'user_id': userId,
      'image_url': imageUrl
    });
  }


}
