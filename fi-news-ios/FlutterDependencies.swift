//
//  FlutterDependencies.swift
//  fi-news-ios
//
//  Created by Markus Reinhold on 25.02.23.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant



class FlutterDependencies: ObservableObject {
  let flutterEngine = FlutterEngine(name: "my flutter engine")
  init(){
    // Runs the default Dart entrypoint with a default Flutter route.
    flutterEngine.run()
    // Connects plugins with iOS platform code to this app.
    GeneratedPluginRegistrant.register(with: self.flutterEngine);
  }
}
