//
//  LoadingController.swift
//  CodeCamp
//
//  Created by Michele Wang on 8/17/18.
//  Copyright © 2018 square. All rights reserved.
//

import UIKit

class LoadingController: UIViewController {
    @IBOutlet weak var loadingController: UIActivityIndicatorView!
    
    var timer:Timer = Timer()
    var moved:Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingController.startAnimating()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadingController.stopAnimating()
        sleep(4)

    }
    

   


}
