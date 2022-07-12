abstract class FromJsonModel<T> {
  T create();

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

}
