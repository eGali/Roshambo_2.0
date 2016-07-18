//
//  History.swift
//  Roshambo
//
//  Created by Edgar on 7/17/16.
//  Copyright © 2016 Edgar. All rights reserved.
//

import Foundation
import UIKit

struct History{
    let image: String
    let result: String
    let plays: String
    
    static let imageKey = "imageKey"
    static let resultKey = "resultKey"
    static let playKey = "playKey"
    
    init(dictionary: [String: String]){
        self.image = dictionary[History.imageKey]!
        self.result = dictionary[History.resultKey]!
        self.plays = dictionary[History.playKey]!
    }
    
}
