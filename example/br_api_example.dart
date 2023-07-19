import 'package:br_api/br_api.dart';

void main() async {
  final cepV1 = await CepV1.searchCepV1(cep: 17512151);
  print(cepV1.city);

  final cepV2 = await CepV2.searchCepV2(cep: 17512151);
  print(cepV2.city);

  final cnpj = await Cnpj.searchCnpj(cnpj: '06947283000160');
  print(cnpj.cnaeFiscalDescricao);

  final corretora = await Corretora.searchCorretoraInformation(
    cnpj: '33764366000196',
  );
  print(corretora.dataInicioSituacao);

  final cptec = await Cptec.airportConditions(icaoCode: 'SBBR');
  print(cptec.condicaoDesc);

  final ddd = await Ddd.stateAndCities(ddd: 11);
  print(ddd.cities);

  final feriados = await Feriado.listFeriados(year: 2023);
  print(feriados[2].name);

  final fipe = await Fipe.listBrands(vehicleType: 'carros');
  print(fipe[11].nome);
}
