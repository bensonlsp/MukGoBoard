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
    var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        skView = gameBoard as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        // Sprite Kit applies additional optimizations to improve rendering performance
        skView.ignoresSiblingOrder = true
        
        // Present a game board to skView
        presentGameBoard(skView)
        
        print("Hello World")
        
        
    }

    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
    @IBAction func restartGame(_ sender: AnyObject) {
        for node:SKNode in skView.scene!.children {
            node.removeFromParent()
        }
        presentGameBoard(skView)
        kifu.resetKifu()
        record.resetRecord()
    }
    
    
    @IBAction func backMove(_ sender: AnyObject) {
        let currentMove = record.backAMove()
        
        if currentMove != nil {
            if let scene = skView.scene as? GameBoardView {
                scene.removeStone(x: currentMove!.x, y: currentMove!.y)
            }
        }
    }
    
    
    @IBAction func forwardMove(_ sender: AnyObject) {
    }
    
    func presentGameBoard(_ view: SKView) {
        if let scene = GameBoardView(fileNamed:"GameBoardView") {
            /* Set the scale mode to scale to fit the window */
            scene.size = view.bounds.size
            scene.scaleMode = .aspectFill
            
            view.presentScene(scene)
        }
    }
}
