import 'dart:convert';

class PersonDetails {
  final String name;
  final String jobTitle;
  final String? company;
  final String? email;
  final String? mobileNumber;
  final String? logoUrl;
  PersonDetails({
    required this.name,
    required this.jobTitle,
    this.company,
    this.email,
    this.mobileNumber,
    this.logoUrl,
  });

  PersonDetails copyWith({
    String? name,
    String? jobTitle,
    String? company,
    String? email,
    String? mobileNumber,
    String? logoUrl,
  }) {
    return PersonDetails(
      name: name ?? this.name,
      jobTitle: jobTitle ?? this.jobTitle,
      company: company ?? this.company,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      logoUrl: logoUrl ?? this.logoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'jobTitle': jobTitle,
      'company': company,
      'email': email,
      'mobileNumber': mobileNumber,
      'logoUrl': logoUrl,
    };
  }

  factory PersonDetails.fromMap(Map<String, dynamic> map) {
    return PersonDetails(
      name: map['name'] as String,
      jobTitle: map['jobTitle'] as String,
      company: map['company'] != null ? map['company'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mobileNumber:
          map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
      logoUrl: map['logoUrl'] != null ? map['logoUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonDetails.fromJson(String source) =>
      PersonDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardData(name: $name, jobTitle: $jobTitle, company: $company, email: $email, mobileNumber: $mobileNumber, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(covariant PersonDetails other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.jobTitle == jobTitle &&
        other.company == company &&
        other.email == email &&
        other.mobileNumber == mobileNumber &&
        other.logoUrl == logoUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        jobTitle.hashCode ^
        company.hashCode ^
        email.hashCode ^
        mobileNumber.hashCode ^
        logoUrl.hashCode;
  }
}
