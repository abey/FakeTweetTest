//
//  MainViewController.swift
//  FakeTweetTest
//
//  Created by Abinodh Thomas on 2020-05-22.
//  Copyright © 2020 Abinodh Thomas. All rights reserved.
//

import UIKit
import MarkovUnchained

class MainViewController: UIViewController {

    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!

    let starters: [String] = ["The", "If", "I", "What", "Why", "Just", "When", "Hey", "Dear", "This", "That", " "]

    override func viewDidLoad() {
        super.viewDidLoad()

        createTweet()
        userNameLabel.text = "- @\(NetworkManager.shared.username) "
    }

    func createTweet() {
        var wordBreakdown: [String] = []
        NetworkManager.shared.tweets = []
        NetworkManager.shared.tweetRequest(username: NetworkManager.shared.username) { _ in
            let tweets = NetworkManager.shared.tweets
            for tweet in tweets {
                var tweetArray = tweet.components(separatedBy: " ")
                for specificTweet in tweetArray {
                    if (specificTweet.range(of: "^(http|https)://", options: .regularExpression, range: nil, locale: .autoupdatingCurrent) != nil) {
                        tweetArray = tweetArray.filter { $0 != specificTweet }
                    }
                }
                wordBreakdown.append(contentsOf: tweetArray)
            }
            self.createChain(data: wordBreakdown)
        }
    }

    private func createChain(data: [String]) {
        let chain = MarkovChain<String>()
        chain.build(from: data) {
            guard let initialState = self.starters.randomElement() else {
                return
            }
            let states = chain.nextStates(30, for: initialState, using: .mixed)
            var text = [initialState]
            text.append(contentsOf: states)
            var generatedTweet = text.joined(separator: " ").components(separatedBy: ".").dropLast().joined(separator: ".")
            print(generatedTweet)
            if generatedTweet == "" {
                DispatchQueue.main.async {
                    self.tweetLabel.text = "Loading..."
                    self.tweetLabel.sizeToFit()
                }
                self.createTweet()
                return
            }
            if generatedTweet.last != "." {
                generatedTweet+="."
            }
            DispatchQueue.main.async {
                self.tweetLabel.text = generatedTweet
                self.tweetLabel.sizeToFit()
            }
        }
    }

    @IBAction func refreshButtonPressed(_ sender: Any) {
        createTweet()
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
