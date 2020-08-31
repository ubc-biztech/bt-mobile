import 'package:bt_mobile/common/backend_request.dart';

class EventsManager {
  List<Event> events = [];

  /// GET information from AWS (network call) (if fails: no internet, backend failed)
  /// ^if successful, store events data in storage
  /// On network call failed, load Events data from storage
  Future setupEventsManager() async {
    bool isGetSuccessful = await getEventsFromBackend();
    if (isGetSuccessful) {
      storeEventsToStorage();
    } else {
      loadEventsFromStorage();
    }
  }

  /// Returns [true] if successfully got data from backend.
  Future<bool> getEventsFromBackend() async {
    try {
      List<Map<String, dynamic>> eventsData =
          await Fetcher().fetchBackend('/events', FetcherMethod.get);
      events = eventsData.map((json) => Event.fromJson(json)).toList();
    } catch (e) {
      return false;
    }
    return true;
  }

  /// Returns [true] if successfully stores event data in storage.
  Future<bool> storeEventsToStorage() async {}

  /// Returns [true] if successfully loads event data from storage.
  Future<bool> loadEventsFromStorage() async {}
}

class Event {
  Event(
      this.location,
      this.imageUrl,
      this.capacity,
      this.checkInCapacity,
      this.updatedAt,
      this.longitude,
      this.latitude,
      this.name,
      this.description,
      this.id,
      this.registeredCount,
      this.checkedInCount,
      this.waitListCount);

  factory Event.fromJson(Map<String, dynamic> json) {
    String location = json['elocation'] ?? '';
    String imageUrl = json['imageUrl'] ?? '';
    int capacity = json['capac'] ?? 0;
    int checkInCapacity = json['checkinCapac'] ?? 0;
    int updatedAt = json['updatedAt'] ?? 0;
    String longitude = json['longitude'] ?? '';
    String latitude = json['latitude'] ?? '';
    String name = json['ename'] ?? '';
    String description = json['description'] ?? '';
    String id = json['id'] ?? '';
    Map<String, dynamic> counts = json['counts'] ?? {};
    int registeredCount = counts['registeredCount'] ?? 0;
    int checkedInCount = counts['checkedInCount'] ?? 0;
    int waitListCount = counts['waitlistCount'] ?? 0;
    return Event(
        location,
        imageUrl,
        capacity,
        checkInCapacity,
        updatedAt,
        longitude,
        latitude,
        name,
        description,
        id,
        registeredCount,
        checkedInCount,
        waitListCount);
  }

  String location;
  String imageUrl;
  int capacity;
  int checkInCapacity;
  int updatedAt;
  String longitude;
  String latitude;
  String name;
  String description;
  String id;

  int registeredCount;
  int checkedInCount;
  int waitListCount;
}
