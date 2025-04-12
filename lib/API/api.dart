import 'package:dio/dio.dart';
import 'package:quotes_app/Models/model.dart';

Future<List<QuoteDataModel>> quoteAPI({int page = 1, int limit = 10}) async{
  final dio = Dio();
  var response = await dio.get(
    'https://sourav-express-quote-api.onrender.com/quotes',
     queryParameters: {
      'page': page,
      'limit': limit
     }
  );
  List<dynamic> dataFromApi = response.data['quotes'];
  //print(dataFromApi);
  return dataFromApi.map((eachData) => QuoteDataModel.fromJson(eachData)).toList();
}