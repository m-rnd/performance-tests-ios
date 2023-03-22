//
//  AlamofireClient.swift
//  fi-news-ios
//
//  Created by Markus Reinhold on 16.03.23.
//

import Foundation
import Alamofire

struct ApiNewsEntry: Decodable {
    let title: String?
}

struct AlamofireClient {
    
    var signposter = Signposter()
    
    func callApi(resultHandler: @escaping ([NewsEntry]) -> Void) {
        signposter.beginInterval("AlamofireClient.callApi")
        AF.request("http://192.168.178.39:3001/news", encoding: JSONEncoding.default).responseDecodable(of: [ApiNewsEntry].self) { response in
            signposter.endInterval("AlamofireClient.callApi")
            
            signposter.beginInterval("AlamofireClient.mapEntities")
            let res = response.value?.compactMap { entity in
                // Mapping der Entities, wenn ein Titel vorhanden ist
                if let title = entity.title {
                    return NewsEntry(title: title)
                }
                return nil
            }
            signposter.endInterval("AlamofireClient.mapEntities")
            resultHandler(res ?? [])
        }
    }
}
