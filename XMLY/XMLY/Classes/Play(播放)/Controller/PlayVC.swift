//
//  PlayVC.swift
//  XMLY
//
//  Created by Rochester on 17/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {

    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backBtn(Any.self)
    }
}
