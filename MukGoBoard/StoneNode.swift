//
//  StoneNode.swift
//  MukGoBoard
//
//  Created by SHUNPAN LO on 14/5/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import UIKit
import SpriteKit


class WhiteStoneNode: SKSpriteNode {
    class func whiteStoneAtPosition(position: CGPoint) -> SKSpriteNode {
        let stoneImageName = "white"
        let whiteStone = WhiteStoneNode(imageNamed: stoneImageName)
        whiteStone.anchorPoint = CGPointMake(0.5, 0.5)
        whiteStone.position = position
        whiteStone.name = "whiteStone"
        
        return whiteStone
    }
}

class BlackStoneNode: SKSpriteNode {
    class func blackStoneAtPosition(position: CGPoint) -> SKSpriteNode {
        let stoneImageName = "black"
        let blackStone = BlackStoneNode(imageNamed: stoneImageName)
        blackStone.anchorPoint = CGPointMake(0.5, 0.5)
        blackStone.position = position
        blackStone.name = "blackStone"
        
        return blackStone
    }
}
