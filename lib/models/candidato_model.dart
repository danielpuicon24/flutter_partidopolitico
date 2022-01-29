class CandidatoModel {
  int id;
  String nombre;
  int numero;
  String resumen;
  String region;
  String? profesion;
  String? email;
  String experiencia;
  String? paginaWeb;
  String? facebook;
  String? twitter;
  String? instagram;
  String foto;

  CandidatoModel({
    required this.id,
    required this.nombre,
    required this.numero,
    required this.resumen,
    required this.region,
    required this.profesion,
    required this.email,
    required this.experiencia,
    required this.paginaWeb,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.foto,
  });

  factory CandidatoModel.fromJson(Map<String, dynamic> json) => CandidatoModel(
        id: json["id"],
        nombre: json["nombre"],
        numero: json["numero"],
        resumen: json["resumen"],
        region: json["region"],
        profesion: json["profesion"] != null ? json["profesion"] : "",
        email: json["email"] != null ? json["email"] : "",
        experiencia: json["experiencia"],
        paginaWeb: json["paginaWeb"] != null ? json["paginaWeb"] : "",
        facebook: json["facebook"] != null ? json["facebook"] : "",
        twitter: json["twitter"] != null ? json["twitter"] : "",
        instagram: json["instagram"] != null ? json["instagram"] : "",
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "numero": numero,
    "resumen": resumen,
    "region": region,
    "profesion": profesion,
    "email": email,
    "experiencia": experiencia,
    "paginaWeb": paginaWeb,
    "facebook": facebook,
    "twitter": twitter,
    "instagram": instagram,
    "foto": foto,
  };
}
