//
//  ExperienceViewController.swift
//  VictoriaSApp
//
//  Created by Vicky Juan on 10/17/18.
//  Copyright © 2018 Victoria Juan. All rights reserved.
//

import UIKit
import AVKit

class ExperienceViewController: UIViewController {
    @IBOutlet weak var sudoMain: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(Back))
        
        navigationItem.title = "Experience"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(gesture:)))
        
        // add it to the image view;
        sudoMain.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        sudoMain.isUserInteractionEnabled = true

    }
    
    @objc func Back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            guard let url = URL(string: "https://sudo.world/") else {
                return
            }
            openURL(url: url)
        }
    }
    
    private func openURL(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func sudoVideo(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "sudoVideo", ofType: "mp4") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
    }
}
