
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:partidopolitico/models/candidato_model.dart';
import 'package:partidopolitico/util/constants.dart';
import 'package:http/http.dart' as http;

class APIServices{

  Future<List<CandidatoModel>> getCandidatoList() async {
    List<CandidatoModel> candidatos = [];

    String path = "$pathProduction/candidato";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    try{
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        final jsonBody = json.decode(source) as List;
        candidatos = jsonBody.map((data) => new CandidatoModel.fromJson(data)).toList();
        return candidatos;
      }
    }
    on TimeoutException catch(e){
      return Future.error(e);
    }

    on SocketException catch(e){ //Esto es cuando no hay internet
      return Future.error(e);
    }

    on Error catch(e){
      return Future.error(e);
    }

    on Exception catch(e){ // only executed if error is of type Exception
      return Future.error(e);
    }
    return candidatos;
  }

}