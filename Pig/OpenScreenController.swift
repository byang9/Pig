//
//  OpenScreenController.swift
//  Pig
//
//  Created by Bowen Yang on 1/3/16.
//  Copyright © 2016 Udemy. All rights reserved.
//

import UIKit

var p1Name = "Player 1"
var p2Name = "Player 2"

class OpenScreenController: UIViewController {

    @IBOutlet var player1Textbox: UITextField!
    @IBOutlet var player2Textbox: UITextField!
    
    @IBAction func start(sender: AnyObject) {
        if (player1Textbox.text != nil) {
            p1Name = player1Textbox.text!
        }
        if player2Textbox.text != nil {
            p2Name = player2Textbox.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}