//
//  BoardNode.swift
//  MukGoBoard
//
//  Created by SHUNPAN LO on 14/5/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import UIKit
import SpriteKit

class BoardNode: SKSpriteNode {
    init(position: CGPoint, size: CGSize) {
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        self.anchorPoint = CGPointMake(0, 0)
        self.position = position
        self.name = "board"
        
        // Get the boardWidth and boardHeight for portrait orientation
        let boardWidth = size.width
        let boardHeight = size.height
        
        // To fill background wood texture to the board
        var shiftx = 0
        var shifty = 0
        var backgroundTextureSize: CGFloat?
        while (shifty < Int(boardHeight)) {
            while (Int(boardWidth) > shiftx) {
                let backgroundTexture = SKSpriteNode(imageNamed: "board-default")
                backgroundTextureSize = backgroundTexture.size.width
                backgroundTexture.anchorPoint = CGPointMake(0, 0)
                backgroundTexture.position = CGPointMake(CGFloat(shiftx), CGFloat(shifty))
                backgroundTexture.zPosition = 1
                self.addChild(backgroundTexture)
                shiftx += Int(backgroundTextureSize!)
            }
            shifty += Int(backgroundTextureSize!)
            shiftx = 0
        }
        
        // Draw 19 horizontal lines
        for i in 1...19 {
            let path: CGMutablePath = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, boardWidth/20, boardHeight/20*CGFloat(i))
            CGPathAddLineToPoint(path, nil, boardWidth-boardWidth/20, boardHeight/20*CGFloat(i))
            let line = SKShapeNode(path: path)
            line.strokeColor = SKColor.blackColor()
            line.lineWidth = 1
            line.zPosition = 2
            self.addChild(line)
        }
        
        // 19 vertical lines
        for i in 1...19 {
            let path: CGMutablePath = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, boardWidth/20*CGFloat(i), boardHeight/20)
            CGPathAddLineToPoint(path, nil, boardWidth/20*CGFloat(i), boardHeight-boardHeight/20)
            let line = SKShapeNode(path: path)
            line.strokeColor = SKColor.blackColor()
            line.lineWidth = 1
            line.zPosition = 2
            self.addChild(line)
        }
        
        // Draw 9 stars
        let positionX: [CGFloat] = [4.0, 10.0, 16.0]
        let positionY: [CGFloat] = [4.0, 10.0, 16.0]
        for x in positionX {
            for y in positionY {
                let star = SKShapeNode(circleOfRadius: boardWidth/20/5)
                star.position = CGPointMake(boardWidth/20*x, boardHeight/20*y)
                star.fillColor = UIColor.blackColor()
                star.strokeColor = UIColor.blackColor()
                star.zPosition = 3
                self.addChild(star)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}