//
//  timer.swift
//  Navigation
//
//  Created by Fedor Boriskin on 08.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class BenchTimer {
    let startTime: CFAbsoluteTime
    var endTime: CFAbsoluteTime?
    
    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()
        return duration!
    }
    
    var duration: CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}
