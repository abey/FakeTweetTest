//
//  NetworkManager.swift
//  FakeTweetTest
//
//  Created by Abinodh Thomas on 2020-05-22.
//  Copyright © 2020 Abinodh Thomas. All rights reserved.
//

import Foundation
import Alamofire
import Swifter

class NetworkManager {

    static var shared = NetworkManager()

    var tweets: [String] = []
    var username: String = ""

    var swifter = Swifter(consumerKey: "C2S6U3bbYBSKJIqYbL8jy0uTr", consumerSecret: "EwA5UHiSDsDs3hnE0bJ4xvHTAWm0pHtgC72jHqOC7mXkZRynXm", oauthToken: "3733743977-wvZg5Bfn8AdLUd9S9g7vIFnRjOvl1cwk3SaJoXJ", oauthTokenSecret: "dMbASB7NSRQGbLBFWLcj12sU1B0rmjH38HvMCefy1c6rN")

    func tweetRequest(username name: String, completion: @escaping (Bool) -> ()) {
        swifter.getTimeline(for: .screenName(name), count: 1000, success: { json in
            guard let tweetArray = json.array else {
                return
            }
            for tweet in tweetArray {
                if tweet["retweeted"] == false {
                    if let tweetText = tweet["text"].string {
                        self.tweets.append(contentsOf: tweetText.components(separatedBy: " "))
                    }
                }
            }
            completion(true)
        }, failure: { error in
            fatalError()
        })

    }
}
