//
//  GameBoard.swift
//  MukGoBoard
//
//  Created by SHUNPAN LO on 14/5/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import UIKit
import SpriteKit

class GameBoardView: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 241/255, green: 174/255, blue: 69/255, alpha: 1.0)
        
        // let board = BoardNode.boardAtPosition(CGPointMake(0,0), size: self.frame.size)
        let board = BoardNode(position: CGPointMake(0, 0), size: self.frame.size)
        self.addChild(board)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let board = self.childNodeWithName("board") as! BoardNode
            board.addStone(location)
            kifu.printKifu()
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
