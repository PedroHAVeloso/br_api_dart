import 'package:br_api/src/data/repository/br_api_repository.dart';

/// Informações referentes a CEPs (Versão 1).
class CepV1 {
  /// Informações disponíveis:
  CepV1({
    required this.cep,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.service,
    required this.errors,
  });

  /// Obter os dados por um json.
  factory CepV1.fromJson(Map<String, dynamic> json) {
    return CepV1(
      cep: json['cep'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      neighborhood: json['neighborhood'] as String?,
      street: json['street'] as String?,
      service: json['service'] as String?,
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
    return data;
  }

  /// Busca por CEP com múltiplos providers de fallback (Versão 01).
  static Future<CepV1> searchCepV1({required int cep}) async {
    return _brApiRepository.filterSearchCepV1(cep: cep);
  }
}
