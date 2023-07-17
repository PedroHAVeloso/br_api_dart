import 'package:br_api/src/data/repository/br_api_repository.dart';

/// Informações referentes a CEPs (Versão 2).
class CepV2 {
  /// Informações disponíveis.
  CepV2({
    required this.cep,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.service,
    required this.location,
    required this.errors,
  });

  /// Obter os dados por um json.
  factory CepV2.fromJson(Map<String, dynamic> json) {
    return CepV2(
      cep: json['cep'].toString(),
      state: json['state'].toString(),
      city: json['city'].toString(),
      neighborhood: json['neighborhood'].toString(),
      street: json['street'].toString(),
      service: json['service'].toString(),
      location: json['location'],
      errors: {
        'name': json['name'],
        'message': json['message'],
        'type': json['type'],
        'errors': json['errors'],
      },
    );
  }

  final String? cep;
  final String? state;
  final String? city;
  final String? neighborhood;
  final String? street;
  final String? service;
  final dynamic location;
  final Map<String, dynamic>? errors;

  static final _brApiRepository = BrApiRepository();

  /// Transformar os dados em um json.
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cep'] = cep;
    data['state'] = state;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    data['street'] = street;
    data['service'] = service;
    data['location'] = location;
    return data;
  }

  /// Busca por CEP com múltiplos providers de fallback (Versão 02).
  static Future<CepV2> searchCepV2({required int cep}) async {
    return _brApiRepository.filterSearchCepV2(cep: cep);
  }
}
