abstract interface class ClientInterface {
  /// Retrieves information from ```endpoint```.
  ///
  /// Returns ideally a ```Map<String, dynamic>``` when ```id != null```
  /// or a ```List<Map<String, dynamic>>``` when ```id == null```
  Future<dynamic> get(String endpoint, {String? id});

  /// Creates a new object in ```endpoint```.
  ///
  /// Returns the data retrieved from API.
  Future<dynamic> create(String endpoint, {required Map<String, dynamic> data});

  /// Replaces (PUT) the entire object in ```endpoint``` identified by ```id```.
  ///
  /// Returns the data retrieved from API.
  Future<dynamic> replace(
    String endpoint, {
    required String id,
    required Map<String, dynamic> data,
  });

  /// Edits (POST) data inside the object in ```endpoint``` identified by ```id```.
  ///
  /// Returns the data retrieved from API.
  Future<dynamic> edit(
    String endpoint, {
    required String id,
    required Map<String, dynamic> data,
  });

  /// Deletes the object in ```endpoint``` identified by ```id```.
  ///
  /// Returns the data retrieved from API.
  Future<dynamic> delete(String endpoint, {required String id});
}
