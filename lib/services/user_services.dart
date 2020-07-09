part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    try {
      _userCollection.document(user.id).setData({
        'email': user.email,
        'name': user.name,
        'balance': user.balance,
        'selectedGenres': user.selectedGenres,
        'selectedLanguage': user.selectedLanguage,
        'profilePicture': user.profilePicture ?? ''
      });
    } catch (e) {
      print(">>> $e");
    }
  }

  static Future<User> getUser(String id) async {
    try {
      DocumentSnapshot snapshot = await _userCollection.document(id).get();

      return User(id, snapshot.data['email'],
          balance: snapshot.data['balance'],
          name: snapshot.data['name'],
          selectedGenres: (snapshot.data['selectedGenres'] as List)
              .map((g) => g.toString())
              .toList(),
          selectedLanguage: snapshot.data['selectedLanguage'],
          profilePicture: snapshot.data['profilePicture']);
    } catch (e) {
      print(">>> $e");
    }
  }
}
