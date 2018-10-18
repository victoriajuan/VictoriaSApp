//
//  EducationViewController.swift
//  VictoriaSApp
//
//  Created by Vicky Juan on 10/17/18.
//  Copyright © 2018 Victoria Juan. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController,  MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(Back))
        
        navigationItem.title = "Contacts"
    }
    
    @objc func Back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Linkedin(_ sender: Any) {
        guard let url = URL(string: "https://www.linkedin.com/in/yiran-victoria-juan/") else {
            return
        }
        openURL(url: url)
    }
    
    @IBAction func Github(_ sender: Any) {
        guard let url = URL(string: "https://github.com/victoriajuan") else {
            return
        }
        openURL(url: url)
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else {
            showMailError()
        }
    }
    
    @IBAction func call(_ sender: Any) {
        let url: NSURL = URL(string: "TEL://9199854038")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    private func openURL(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["vicky37@uw.edu"])
        mailComposerVC.setSubject("Hello from Victoria's App")
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Couldn't send mail", message: "Your device couldn't send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
