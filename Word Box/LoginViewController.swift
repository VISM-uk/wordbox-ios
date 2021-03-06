//
//  LoginViewController.swift
//  Word Box
//
//  Created by Ted Eriksson on 09/05/2015.
//  Copyright (c) 2015 Vism. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var  email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func clickSignUp(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signIn = storyboard.instantiateViewControllerWithIdentifier("SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(signIn, animated: true)
    }
    
    @IBAction func clickLogin(sender: AnyObject?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resolve = storyboard.instantiateViewControllerWithIdentifier("ResolveLoginViewController") as! ResolveLoginViewController
        resolve.signInUser(email.text, password: password.text)
        navigationController?.pushViewController(resolve, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 200
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 200
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}