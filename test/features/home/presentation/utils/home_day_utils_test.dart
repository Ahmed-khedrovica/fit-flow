// import 'package:fit_flow/features/home/presentation/utils/home_day_utils.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   group("HomeDaySlotUtility active slots calculation tests", () {
//     const total = 3;
//
//     test(
//         'should return [0, 2, 4] when it is Saturday (day 0) and no workouts have been played',
//         () {
//       final slots = HomeDaySlotUtility.calculateActiveSlots(
//         total,
//         0,
//         null,
//         0,
//       );
//       expect(slots, [0, 2, 4]);
//     });
//
//     test(
//         'should return [0, 2, 4] on Saturday (day 0) even if one day was already played previously',
//         () {
//       final slots = HomeDaySlotUtility.calculateActiveSlots(
//         total,
//         1,
//         1,
//         0,
//       );
//       expect(slots, [0, 2, 4]);
//     });
//
//     test(
//         'should return [4, 6] when it is Sunday (day 1) and we already played on Sunday (slot 1)',
//         () {
//       final slots = HomeDaySlotUtility.calculateActiveSlots(
//         total,
//         1,
//         1,
//         1,
//       );
//       expect(slots, [2,4]);
//     });
//
//     test(
//         'should maintain [4, 6] when it is Monday (day 2) after having played the first workout on Sunday (slot 1)',
//         () {
//       final slots = HomeDaySlotUtility.calculateActiveSlots(
//         total,
//         1,
//         1,
//         2,
//       );
//       expect(slots, [2, 4]);
//     });
//   });
// }