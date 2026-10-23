/// Central registry of every backend route string.
/// Base URL is configured on the Dio instance — only paths go here.
/// Never hardcode a route string anywhere else in the codebase.
abstract final class ApiEndpoints {
  // ── Auth ─────────────────────────────────────────────────────────
  static const String upload = '/uploads';
  static const String images = '/images';
  static const String pair = '/pair';
}
