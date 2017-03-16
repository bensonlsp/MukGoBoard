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
            case .black: texture = SKTexture(imageNamed: "black")
            case .white: texture = SKTexture(imageNamed: "white")
        }
        
        super.init(texture: texture, color: UIColor.clear, size: texture!.size())
        self.name = "stone\(x)x\(y)"
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = 4
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
