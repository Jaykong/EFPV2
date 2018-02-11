//
//  FullVideoViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/6.
//  Copyright © 2018 JayKong. All rights reserved.
//

import AVKit
import UIKit

class FullVideoViewController: UIViewController {
    var playerViewController: AVPlayerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "club", withExtension: "mp4")

        let avPlayer = AVPlayer(url: url!)
        playerViewController = AVPlayerViewController()
        playerViewController.player = avPlayer

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
