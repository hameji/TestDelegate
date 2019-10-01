//
//  ViewController.swift
//  TestDelegate
//
//  Created by  on 2019/10/01.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate{
    func nextDidFinished(nextText: String)
}

class NextViewController: UIViewController {

    var delegate: NextViewControllerDelegate! = nil
    let text1 = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.orange
        
        self.text1.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        self.text1.layer.position = CGPoint(x: self.view.frame.width/2, y:100)
        self.text1.backgroundColor = UIColor.white
        self.view.addSubview(self.text1)
        
        let submitBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        submitBtn.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.addTarget(self, action: #selector(submit), for: .touchUpInside)
        self.view.addSubview(submitBtn)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func submit(sender: AnyObject) {
        self.delegate.nextDidFinished(nextText: self.text1.text!)
    }
}
