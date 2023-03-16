//
//  ContentView.swift
//  fi-news-ios
//
//  Created by Markus Reinhold on 25.02.23.
//

import SwiftUI
import Flutter
import os.signpost


struct ContentView: View {
  // Flutter dependencies are passed in an EnvironmentObject.
  @EnvironmentObject var flutterDependencies: FlutterDependencies

    @State private var isLoading = false


  // Button is created to call the showFlutter function when pressed.
  var body: some View {
      VStack {
          Button("Show Flutter!") {
            showFlutter()
          }
          if (isLoading) { Text("loading...") }
      }
  }

func showFlutter() {
    
    let log = OSLog(
        subsystem: "test.fi-news-ios",
        category: "PointsOfInterest"
    )
    let signpostID = OSSignpostID(log: log)
    
    
    let api = FlutterNewsApi(binaryMessenger: flutterDependencies.flutterEngine.binaryMessenger)
    isLoading = true
    NSLog ("loading started")
    os_signpost(
        .begin,
        log: log,
        name: "Call Flutter API",
        signpostID: signpostID
    )
    api.getNews(completion: {(data) in
        // print(data)
        isLoading = false
        NSLog ("loading ended")
        os_signpost(
            .end,
            log: log,
            name: "Call Flutter API",
            signpostID: signpostID
        )
    })
  }
}



struct ContentViewProvider: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
