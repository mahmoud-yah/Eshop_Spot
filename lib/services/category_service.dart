import 'package:eshop_spot/models/category_model.dart';
import 'package:eshop_spot/models/product_model.dart';
import 'package:eshop_spot/utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future <List<String>> getCategory() async {
    var response = await http.get(
      Uri.parse('$baseUrl/products/categories'),
    );
    if(response.statusCode==200){
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    }else {
      return throw Exception('Failed to load the categories');
    }
  }


  static Future <List<ProductModel>> getCategoryItems(String categoryName) async {
    var response = await http.get(
      Uri.parse('$baseUrl/products/category/$categoryName'),
    );
    if(response.statusCode==200){
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    }else {
      return throw Exception('Failed to load the categories');
    }
  }
}
