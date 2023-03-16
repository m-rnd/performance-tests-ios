//
//  fi_news_iosApp.swift
//  fi-news-ios
//
//  Created by Markus Reinhold on 25.02.23.
//

import SwiftUI

@main
struct FiApp: App {
    @StateObject var flutterDependencies = FlutterDependencies()
        var body: some Scene {
          WindowGroup {
            ContentView().environmentObject(flutterDependencies)
          }
        }
}
