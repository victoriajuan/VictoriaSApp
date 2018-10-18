//
//  MainPage.swift
//  VictoriaSApp
//
//  Created by Vicky Juan on 10/16/18.
//  Copyright © 2018 Victoria Juan. All rights reserved.
//

import UIKit

class MainPageController: UIViewController {
    
    @IBOutlet weak var skillButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var projectButton: UIButton!
    @IBOutlet weak var experienceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skillButton.addTarget(self, action: #selector(textTap), for: UIControl.Event.touchUpInside)
        educationButton.addTarget(self, action: #selector(textTap), for: UIControl.Event.touchUpInside)
        projectButton.addTarget(self, action: #selector(textTap), for: UIControl.Event.touchUpInside)
        experienceButton.addTarget(self, action: #selector(textTap), for: UIControl.Event.touchUpInside)
        
    }

    @objc func textTap(sender: UIButton) {
        // or perform segue if you use storyboards
        self.performSegue(withIdentifier: "skills", sender: self)
        self.performSegue(withIdentifier: "contact", sender: self)
        self.performSegue(withIdentifier: "projects", sender: self)
        self.performSegue(withIdentifier: "experience", sender: self)
    }
}


