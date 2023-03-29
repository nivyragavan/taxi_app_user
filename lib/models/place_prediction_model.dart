class PlacePredictionModel{
  String? place_id;
  String? main_text;
  String? secondary_text;
  PlacePredictionModel({this.place_id,this.main_text,this.secondary_text});

  PlacePredictionModel.fromJson(Map<String , dynamic> json){
    place_id = json["place_id"];
    main_text = json["structured_formatting"]["main_text"];
    secondary_text = json["structured_formatting"]["secondary_text"];
  }
}