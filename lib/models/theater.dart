part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("Bintaro Xchange XXI"),
  Theater("CGV Cinemas - Teraskota"),
  Theater("Transpark Bintaro 7 XXI"),
  Theater("Cinema XXI Lotte Mall")
];
