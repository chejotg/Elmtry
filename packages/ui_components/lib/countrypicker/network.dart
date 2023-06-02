import 'package:dio/dio.dart';

var apikey = "eheX17XqCBWTDyYGtnyawZ3TtRHFHvmhDlBRA00NJPPLw7xvjRxrzKOsKNUVynWk";
var dataApiEndpoint =
    "https://data.mongodb-api.com/app/data-mdoas/endpoint/data/v1/action/find";
Future<List> getCountries() async {
  Dio dioDataApi = Dio();
  dioDataApi.options.headers['content-Type'] = 'application/json';
  dioDataApi.options.headers["Access-Control-Request-Headers"] = "*";
  dioDataApi.options.headers["api-key"] = apikey;
  var body = {
    "collection": "CountryAppSettings",
    "database": "Settings",
    "dataSource": "Cluster0",
    "filter": {"_partition": "RPN"}
  };
  var response = await dioDataApi.post(
    dataApiEndpoint,
    data: body,
    onSendProgress: (int sent, int total) {
      //var d = (sent / total);
    },
    onReceiveProgress: (count, total) {},
  );
  if (response.data.toString().contains("documents")) {
    return response.data["documents"];
  } else {
    return [];
  }
  /*  var bodyQuery = gql(
      """query(\$part:String){countryAppSettingsProds(query:{_partition:\$part}) {
    code
    descriptionCountry
  }}""");
  var result = await graphQLClient.query(
    QueryOptions(
      document: bodyQuery,
      variables: const {'part': "RPN"},
    ),
  );
  var p = result.data != null ? result.data!['countryAppSettingsProds'] : [];
  return p; */
}
