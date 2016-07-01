//
//  StoneNode.swift
//  MukGoBoard
//
//  Created by SHUNPAN LO on 14/5/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import UIKit
import SpriteKit


class StoneNode: SKSpriteNode {
    init(stoneColor: StoneColor, position: CGPoint) {
        var texture: SKTexture?
        
        switch stoneColor {
            case .Black: texture = SKTexture(imageNamed: "black")
            case .White: texture = SKTexture(imageNamed: "white")
        }
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture!.size())
        self.anchorPoint = CGPointMake(0.5, 0.5)
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
