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
    init(stoneColor: StoneColor, position: CGPoint, x: Int, y: Int) {
        var texture: SKTexture?
        
        switch stoneColor {
            case .Black: texture = SKTexture(imageNamed: "black")
            case .White: texture = SKTexture(imageNamed: "white")
        }
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture!.size())
        self.name = "stone\(x)x\(y)"
        self.anchorPoint = CGPointMake(0.5, 0.5)
        self.zPosition = 4
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
