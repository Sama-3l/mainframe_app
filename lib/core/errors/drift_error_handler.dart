import 'package:drift/drift.dart';
import 'package:drift/remote.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';

Future<T?> executeWithDriftHandling<T>({
  required Future<T> Function() operation,
}) async {
  try {
    return (await operation());
  } on DriftWrappedException catch (e) {
    // ✅ Handle known wrapped exceptions with their message
    throw (LocalStorageException(message: e.message));
  } on DriftRemoteException catch (e) {
    // ✅ Convert DriftRemoteException into a user-friendly message
    if (e.toString().contains("no such table")) {
      return null;
    }
    final errorMessage = _mapDriftRemoteErrorToMessage(e);
    throw (LocalStorageException(message: errorMessage));
  } catch (e) {
    // ✅ Fallback for unknown errors
    final message = e.toString();
    throw (
      LocalStorageException(
        message: message.contains("Unique constraint")
            ? "Item already exists"
            : "Something went wrong. Please try again.",
      ),
    );
  }
}

/// Maps DriftRemoteException into a user-friendly message.
String _mapDriftRemoteErrorToMessage(DriftRemoteException e) {
  final remoteMessage = e.remoteCause.toString().toLowerCase();

  if (remoteMessage.contains("unique constraint")) {
    return "Item already exists"; // simpler, non-technical
  } else if (remoteMessage.contains("not found")) {
    return "We couldn't find the item you were looking for.";
  } else if (remoteMessage.contains("connection")) {
    return "We are having trouble connecting to the database. Please try again later.";
  } else {
    return "Something went wrong. Please try again.";
  }
}
