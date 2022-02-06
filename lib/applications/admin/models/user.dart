class User {
  User({
    required this.id,
    required this.name,
    required this.userSlug,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
  });

  final int id;
  final String name;
  final String userSlug;
  final String email;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Role> roles;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        userSlug: json["User_slug"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "User_slug": userSlug,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "roles": List<dynamic>.from(roles.map((x) => x.toMap())),
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  final int id;
  final String name;
  final String guardName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromMap(json["pivot"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toMap(),
      };
}

class Pivot {
  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  final int modelId;
  final int roleId;
  final String modelType;

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
      );

  Map<String, dynamic> toMap() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
      };
}
