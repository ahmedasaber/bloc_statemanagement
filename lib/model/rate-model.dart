import 'package:equatable/equatable.dart';

class Rating extends Equatable{

  final double? rate;
  final int? count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> jsonDate){
    return Rating(
      rate: jsonDate['rate'].toDouble(),
      count: jsonDate['count']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'rate': rate,
      'count': count
    };
  }

  @override
  List<Object?> get props => [rate, count];

}