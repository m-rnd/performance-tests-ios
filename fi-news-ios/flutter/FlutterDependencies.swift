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
    let signposter: Signposter = Signposter()
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    
    init(){
        signposter.beginInterval("flutter init")
        flutterEngine.run()
        signposter.endInterval("flutter init")
        
        signposter.beginInterval("register")
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
        signposter.endInterval("register")
    }
    
    func callApi(resultHandler: @escaping ([NewsEntry]) -> Void) {
        let api = FlutterNewsApi(binaryMessenger: flutterEngine.binaryMessenger)
        
        signposter.beginInterval("FlutterDependencies.callApi")
        api.getNews(completion: {(data) in
            self.signposter.endInterval("FlutterDependencies.callApi")
            
            self.signposter.beginInterval("FlutterDependencies.mapEntities")
            let res = data.compactMap { entity in
                if let title = entity.title {
                    return NewsEntry(title: title)
                }
                return nil
            }
            self.signposter.endInterval("FlutterDependencies.mapEntities")
            
            resultHandler(res)
        })
    }
}
