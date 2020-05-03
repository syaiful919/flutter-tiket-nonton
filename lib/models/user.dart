part of 'models.dart';

class User extends Equatable {
  final String id;
  final String profilePicture;
  final String name;
  final String email;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  User(this.id, this.email,
      {this.profilePicture,
      this.name,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance});

  User copyWth({String name, String profilePicture, int balance}) => User(
        this.id,
        this.email,
        name: name ?? this.name,
        profilePicture: profilePicture ?? this.profilePicture,
        balance: balance ?? this.balance,
        selectedGenres: this.selectedGenres,
        selectedLanguage: this.selectedLanguage,
      );

  @override
  List<Object> get props => [
        id,
        email,
        profilePicture,
        name,
        selectedGenres,
        selectedLanguage,
        balance
      ];

  @override
  String toString() {
    return '{id: $id, name: $name, email: $email}';
  }
}
