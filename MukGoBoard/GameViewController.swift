//
//  GameViewController.swift
//  MukGoBoard
//
//  Created by SHUNPAN LO on 4/5/2016.
//  Copyright (c) 2016年 imukmuk. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    @IBOutlet weak var gameBoard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameBoardView(fileNamed:"GameBoardView") {
            // Configure the view.
            let skView = gameBoard as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.size = skView.bounds.size
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    @IBAction func restartGame(sender: AnyObject) {
        
        
    }
    
}
