// ignore_for_file: unused_field

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:light_logger/light_logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:theta/src/client.dart';
import 'package:theta/src/core/connection_mode.dart';
import 'package:theta/src/data/models/get_page_response.dart';
import 'package:theta/src/dependency_injection/di.dart';
import 'package:theta_analytics/theta_analytics.dart';
import 'package:theta_open_widgets/theta_open_widgets.dart';

/// Theta instance.
///
/// ❗️ Initialize before use, otherwise an error is thrown.
///
/// ```dart
/// await Theta.initialize(...)
/// ```
class Theta {
  Theta._();

  /// Gets the current Theta instance.
  ///
  /// An [AssertionError] is thrown if Theta isn't initialized yet.
  /// Call [Theta.initialize] to initialize it.
  static Theta get instance {
    assert(
      _instance._initialized,
      'You must initialize Theta instance before calling Theta.instance',
    );
    return _instance;
  }

  /// Returns if the instance is initialized or not.
  static bool get isInitialized => _instance._initialized;

  /// Initialize the current Theta instance.
  ///
  /// - `anonKey` is the anonymous key used to authenticate the request.
  /// This key is used to authenticate the request.
  /// Safe to use in client-side applications.
  /// You can get one at https://app.buildwiththeta.com.
  /// ❗️ Store the anon key in a safe place like a .env file.
  ///
  /// - `connectionMode` is used to define the connection mode.
  /// Default: continuous
  ///
  ///   - continuous: Components are fetched from the server at every app launch. 🟡 Recommended during development.
  ///   - cached: Components are fetched from the server only if the cache is expired. 🟢 Safe to use in production.
  ///   - preloaded: Immediate loading. Components are retrieved either from a local file or from the server. 🟢 Safe to use in production.
  ///
  /// - `customPreloadedJson` is a custom preload json for immediate loading.
  /// By default Theta will use `/assets/theta_preloading.json` file.
  /// You can override this file by passing a custom preload json,
  /// for example from a .env file.
  ///
  /// - `cacheExtension` is the cache extension in seconds.
  /// Default: 43200 (12 hours)
  ///
  /// 🟡 Any issue? Please, open an issue at https://github.com/buildwiththeta/buildwiththeta/issues
  static Future<Theta> initialize({
    /// Anonymous key.
    /// This key is used to authenticate the request.
    ///
    /// Safe to use in client-side applications.
    /// ❗️ Store this key in a safe place like a .env file.
    required String anonKey,

    /// ConnectionMode is used to define the connection mode.
    /// Default: continuous
    ///
    /// - continuous: Components are fetched from the server at every app launch. 🟡 Recommended during development.
    /// - cached: Components are fetched from the server only if the cache is expired. 🟢 Safe to use in production.
    /// - preloaded: Immediate loading. Components are retrieved either from a local file or from the server. 🟢 Safe to use in production.
    ConnectionMode connectionMode = ConnectionMode.continuous,

    /// Custom preload file.
    /// By default Theta will use /assets/theta_preloading.json file.
    /// You can override this file by passing a custom preload json,
    /// for example from a .env file.
    Map<String, dynamic>? customPreloadedJson,

    /// Cache extension in seconds.
    /// Default: 43200 (12 hours)
    int cacheExtension = 43200,
  }) async {
    await _instance._init(
      anonKey,
      cacheExtension,
      connectionMode,
      customPreloadedJson,
    );
    Logger.printDefault('Theta init completed $_instance');
    return _instance;
  }

  static final Theta _instance = Theta._();

  bool _initialized = false;

  late ThetaClient _client;

  Future<void> _initExternalDependencies() async {
    await ThetaOpenWidgets.initialize();
    await ThetaAnalytics.initialize();
    if (kIsWeb) return;
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  Future<void> _initializeCore() async {
    _client = getIt();
    await _client.initialize();
  }

  Future<void> _init(
    String key,
    int cacheExtension,
    ConnectionMode connectionMode,
    Map<String, dynamic>? customPreloadFile,
  ) async {
    await _initExternalDependencies();
    await initializeDependencyInjection(
      key,
      cacheExtension,
      connectionMode,
      customPreloadFile,
    );
    await _initializeCore();
    _initialized = true;
  }

  /// Build a remote UI component.
  Future<Either<Exception, GetPageResponseEntity>> build(
          final String componentName) =>
      _client.build(componentName);

  /// Dispose the current Theta instance.
  void dispose() {
    disposeDependencies();
    _initialized = false;
  }
}
