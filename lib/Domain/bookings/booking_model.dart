import 'booking.dart';

class BookingModel {
  List<Booking>? bookings;
  String? name;

  BookingModel({this.bookings, this.name});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        bookings: (json['bookings'] as List<dynamic>?)
            ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
            
      );

  Map<String, dynamic> toJson() => {
        'bookings': bookings?.map((e) => e.toJson()).toList(),
        'name': name,
      };
}
