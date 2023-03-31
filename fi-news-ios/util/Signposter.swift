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
    
    
    func beginInterval(_ name: StaticString) {
        let arg: String = "\(name)"
        os_signpost(.begin, log: log, name: name, "begin %{public}s", arg)
    }
    
    func endInterval(_ name: StaticString) {
        let arg: String = "\(name)"
        os_signpost(.end,log: log, name: name, "end %{public}s", arg)
    }
}
