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
        AF.request("http://10.102.17.45:3001/news", encoding: JSONEncoding.default).responseDecodable(of: [ApiNewsEntry].self) { response in
            signposter.endInterval("AlamofireClient.callApi")
            
            signposter.beginInterval("AlamofireClient.getResponseValue")
            let res = response.value
            signposter.endInterval("AlamofireClient.getResponseValue")
            
            signposter.beginInterval("AlamofireClient.mapEntities")
            let entries = res?.compactMap { entity in
                // Mapping der Entities, wenn ein Titel vorhanden ist
                if let title = entity.title {
                    return NewsEntry(title: title)
                }
                return nil
            }
            signposter.endInterval("AlamofireClient.mapEntities")
            resultHandler(entries ?? [])
        }
    }
}
