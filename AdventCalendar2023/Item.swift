//
//  Item.swift
//  AdventCalendar2023
//
//  Created by 中川祥平 on 2023/11/01.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
