import 'package:bt_mobile/common/backend_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class EventsManager {
  List<Event> events = [];
  SharedPreferences _preferences;
  static const _eventsKey = 'events_key';

  /// GET information from AWS (network call) (if fails: no internet, backend failed)
  /// ^if successful, store events data in storage
  /// On network call failed, load Events data from storage
  Future setupEventsManager() async {
    bool isGetSuccessful = await getEventsFromBackend();
    _preferences ??= await SharedPreferences.getInstance();

    if (isGetSuccessful) {
      storeEventsToStorage();
    } else {
      loadEventsFromStorage();
    }
  }

  /// Returns [true] if successfully got data from backend.
  Future<bool> getEventsFromBackend() async {
    try {
      List<dynamic> eventsData =
          await Fetcher().fetchBackend('/events', FetcherMethod.get);
      events = eventsData.map((json) => Event.fromJson(json)).toList();
    } catch (e) {
      return false;
    }
    return true;
  }

  /// Returns [true] if successfully stores event data in storage.
  Future<bool> storeEventsToStorage() async {
    String eventsJson = jsonEncode(events);
    if (_preferences.containsKey(_eventsKey) &&
        _preferences.getString(_eventsKey) == eventsJson){
      return false;
    }
    await _preferences.setString(_eventsKey, eventsJson);
    return true;
  }

  /// Returns [true] if successfully loads event data from storage.
  Future<bool> loadEventsFromStorage() async {    
    if (!_preferences.containsKey(_eventsKey)) {
      return false;
    }
    String eventsJson = _preferences.getString(_eventsKey);
    events = jsonDecode(eventsJson);
    return true;
  }
}

class Event {
  Event(
      this.location,
      this.imageUrl,
      this.capacity,
      this.checkInCapacity,
      this.updatedAt,
      this.code,
      this.longitude,
      this.latitude,
      this.startDate,
      this.endDate,
      this.name,
      this.description,
      this.id,
      this.registeredCount,
      this.checkedInCount,
      this.waitListCount);

  factory Event.fromJson(Map<String, dynamic> json) {
    String location = json['elocation'] ?? '';
    String imageUrl = json['imageUrl'] ?? '';
    int capacity;
    try {
      capacity = json['capac'] ?? 0;
    } catch (e) {
      capacity = int.parse(json['capac']) ?? 0;
    }
    int checkInCapacity = json['checkinCapac'] ?? 0;
    int updatedAt = json['updatedAt'] ?? 0;
    String code = json['code'] ?? '';
    String longitude = json['longitude'] ?? '';
    String latitude = json['latitude'] ?? '';
    String startDate = json['startDate'] ?? '';
    String endDate = json['endDate'] ?? '';
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
        code,
        longitude,
        latitude,
        startDate,
        endDate,
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
  String code;
  String longitude;
  String latitude;
  String startDate;
  String endDate;
  String name;
  String description;
  String id;

  int registeredCount;
  int checkedInCount;
  int waitListCount;
}
