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
        let board = BoardNode(position: CGPointMake(0, 0), size: self.frame.size)
        self.addChild(board)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let locationTuple = freeLocationToFixedLocation(location)
            let board = self.childNodeWithName("board") as! BoardNode
            if (kifu.returnMark(x: locationTuple.x, y: locationTuple.y) == Mark.Empty) {
                board.addStone(x: locationTuple.x, y: locationTuple.y, location: locationTuple.fixedLocation)
            } else {
                print("Not empty!")
            }
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func freeLocationToFixedLocation(location: CGPoint) -> (fixedLocation: CGPoint, x: Int, y: Int) {
        let unitWidth = self.size.width/20
        let unitHeight = self.size.height/20
        var shiftx = 0
        var shifty = 0
        var fixedLocation = location
        
        fixedLocation.x -= unitWidth/2
        fixedLocation.y -= unitHeight/2
        
        while (fixedLocation.x > 0) {
            shiftx += 1
            fixedLocation.x = fixedLocation.x - unitWidth
            if shiftx > 19 {
                shiftx = 19
            }
        }
        
        while (fixedLocation.y > 0) {
            shifty += 1
            fixedLocation.y = fixedLocation.y - unitHeight
            if shifty > 19 {
                shifty = 19
            }
        }
        
        fixedLocation.x = unitWidth * CGFloat(shiftx)
        fixedLocation.y = unitHeight * CGFloat(shifty)
        
        return (fixedLocation, shiftx, shifty)
    }
}
