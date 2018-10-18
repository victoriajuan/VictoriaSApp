//
//  SkillsViewController.swift
//  VictoriaSApp
//
//  Created by Vicky Juan on 10/17/18.
//  Copyright © 2018 Victoria Juan. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(Back))
        
        navigationItem.title = "Skills"
    }
    
    @objc func Back() {
        self.dismiss(animated: true, completion: nil)
    }

}
