import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil{
  final String? name;
  final String? country;
  final String? city;
  final int? edad;
  final List<String>? friends;
  final List<DocumentReference>? rooms;
  final String? uid;


  Perfil({
    this.name="",
    this.country="",
    this.city="",
    this.edad=0,
    this.friends=const [],
    this.rooms=const [],
    this.uid=""
  });

  factory Perfil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil(
      name: data?['name'],
      country: data?['country'],
      city: data?['city'],
      edad: data?['edad'],
      friends: data?['friends'] is Iterable? List.from(data?['friends']):null,
      rooms: data?['rooms']is Iterable? List.from(data?['rooms']):null,
      uid:snapshot.id,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (country != null) "country": country,
      if (city != null) "capital": city,
      if (edad != 0) "edad": edad,
      if (friends!.isNotEmpty) "friends":friends,
      if (rooms!.isNotEmpty) "rooms": rooms,
    };
  }
}