//
//  Tweet.swift
//  FakeTweetTest
//
//  Created by Abinodh Thomas on 2020-05-22.
//  Copyright © 2020 Abinodh Thomas. All rights reserved.
//

import Foundation

struct Tweet: Decodable {
    let text: String
    let retweeted: Bool
}
