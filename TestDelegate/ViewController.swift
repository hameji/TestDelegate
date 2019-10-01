//
//  ViewController.swift
//  TestDelegate
//
//  Created by  on 2019/10/01.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class ViewController: UIViewController, NextViewControllerDelegate {

    let nextView = NextViewController()
    let nextTextLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let showModalBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        showModalBtn.layer.position = CGPoint(x: self.view.frame.width/2, y: 100)
        showModalBtn.setTitle("Show Modal", for: .normal)
        showModalBtn.setTitleColor(UIColor.blue, for: .normal)
        showModalBtn.addTarget(self, action: #selector(showNext), for:.touchUpInside)
        self.view.addSubview(showModalBtn)
        
        self.nextTextLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        self.nextTextLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        self.nextTextLabel.textAlignment = .center
        self.nextTextLabel.text = "The Modal text is ..."
        self.nextTextLabel.textColor = UIColor.black
        self.view.addSubview(nextTextLabel)
        
        self.nextView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func showNext(sender: AnyObject){
        self.present(self.nextView, animated: true, completion: nil)
    }

    func nextDidFinished(nextText: String){
        print(nextText)
        self.nextTextLabel.text = nextText
        self.nextView.dismiss(animated: true, completion: nil)
    }
}

