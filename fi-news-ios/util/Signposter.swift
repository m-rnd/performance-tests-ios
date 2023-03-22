//
//  Signposter.swift
//  fi-news-ios
//
//  Created by Markus Reinhold on 16.03.23.
//

import Foundation
import os.signpost


class Signposter: ObservableObject {
    
    
    lazy private var log = OSLog(
        subsystem: "test.fi-news-ios",
        category: "PointsOfInterest"
    )
    lazy private var signpostID = OSSignpostID(log: log)
    
    
    func beginInterval(_ name: String) {
        os_signpost(.begin, log: log, name: "native", "begin %{public}s", name)
    }
    
    func endInterval(_ name: String) {
         os_signpost(.end,log: log, name: "native", "end %{public}s", name)
    }
    
    
}
