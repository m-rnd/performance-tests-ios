//
//  NewsRespository.swift
//  fi-news-ios
//
//  Created by Markus Reinhold on 16.03.23.
//

import Foundation


struct NewsRepository {
    func callApi(flutter: Bool, resultHandler: @escaping ([NewsEntry]) -> Void) {
        if (flutter) {
            FlutterDependencies().callApi(resultHandler: resultHandler)
        } else {
            AlamofireClient().callApi(resultHandler: resultHandler)
        }
    }
}
