package com.ubcbiztech.bt_mobile

import androidx.annotation.NonNull
import com.pycampers.flutter_cognito_plugin.CognitoPluginActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : CognitoPluginActivity("adinwashere") {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
