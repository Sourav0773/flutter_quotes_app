import 'package:dio/dio.dart';
import 'package:quotes_app/model.dart';

Future<List<QuoteDataModel>> quoteAPI() async{
  final dio = Dio();
  var response = await dio.get('https://sourav-express-quote-api.onrender.com/quotes');
  List<dynamic> dataFromApi = response.data;
  //print(dataFromApi);
  return dataFromApi.map((eachData) => QuoteDataModel.fromJson(eachData)).toList();
}
