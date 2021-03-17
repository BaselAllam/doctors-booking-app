

class DoctorModel{

  String id;
  String doctorName;
  double fee;
  String location;
  double rate;
  String university;
  String category;
  String collegeImage;
  String doctorImage;


  DoctorModel({this.id, this.doctorName, this.fee, this.location, this.rate, this.university, this.category, this.collegeImage, this.doctorImage});


  factory DoctorModel.fromJson(Map<String, dynamic> json, id){
    return DoctorModel(
      id: id,
      doctorName: json['doctorName'],
      fee: json['fee'],
      location: json['location'],
      rate: json['rate'],
      university: json['university'],
      category: json['category'],
      collegeImage: json['collegeImage'],
      doctorImage: json['doctorImage']
    );
  }

}