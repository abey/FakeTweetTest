//
//  ViewController.swift
//  FakeTweetTest
//
//  Created by Abinodh Thomas on 2020-05-12.
//  Copyright © 2020 Abinodh Thomas. All rights reserved.
//

import UIKit
import MarkovUnchained

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func getTweetsPressed(_ sender: Any) {
        goToNextPage(name: textField.text ?? "")
    }

    @IBAction func apike(_ sender: Any) {
        goToNextPage(name: "apike")
    }
    @IBAction func erica(_ sender: Any) {
        goToNextPage(name: "ehyleong")
    }
    @IBAction func brady(_ sender: Any) {
        goToNextPage(name: "brady")
    }
    @IBAction func brendan(_ sender: Any) {
        goToNextPage(name: "BrendanLensink")
    }
    @IBAction func sswchen(_ sender: Any) {
        goToNextPage(name: "ssawchen")
    }
    @IBAction func nigel(_ sender: Any) {
        goToNextPage(name: "nigelbrooke")
    }
    @IBAction func abey(_ sender: Any) {
        goToNextPage(name: "abinodh")
    }
    @IBAction func steamclock(_ sender: Any) {
        goToNextPage(name: "steamclocksw")
    }
    @IBAction func tredeau(_ sender: Any) {
        goToNextPage(name: "JustinTrudeau")
    }
    @IBAction func trump(_ sender: Any) {
        goToNextPage(name: "realDonaldTrump")
    }
    @IBAction func cbcAlerts(_ sender: Any) {
        goToNextPage(name: "CBCAlerts")
    }

    func goToNextPage(name: String) {
        NetworkManager.shared.username = name
        self.performSegue(withIdentifier: "goToGeneratorPage", sender: nil)
    }

}

