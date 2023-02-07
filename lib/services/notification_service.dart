import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:weather_app/models/weather_model.dart';

class NotificationService {
  Future<void> createDaily7amNotification(WeatherModel? weatherModel) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime.now().microsecondsSinceEpoch.remainder(10000),
          channelKey: "firstChannel",
          title: "${Emojis.icon_thought_balloon} it's going to be ${weatherModel!.conditionText!.toLowerCase()} today",
          body: "Take care of yourself",
          wakeUpScreen: true,
          displayOnBackground: true,
          displayOnForeground: true,
        ),
        schedule: NotificationCalendar(
          repeats: true,
          allowWhileIdle: true,
          second: 0,
          millisecond: 0,
          hour: 7,
          minute: 0,
          timeZone: AwesomeNotifications.localTimeZoneIdentifier,
        ));
  }

  Future<void> createDaily2PMNotification(WeatherModel? weatherModel) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().microsecondsSinceEpoch.remainder(10000),
        channelKey: "dailytwopmchannel",
        title: "Friendly reminder",
        body: "It's ${weatherModel!.forecast[0]!.maxTemp!.toInt()}℃ out there",
        notificationLayout: NotificationLayout.Default,
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
      ),
      schedule: NotificationCalendar(
        repeats: true,
        allowWhileIdle: true,
        second: 0,
        millisecond: 0,
        hour: 14,
        minute: 0,
        timeZone: AwesomeNotifications.localTimeZoneIdentifier,
      ),
    );
  }
}
