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
    
    class func boardAtPosition(position: CGPoint, size: CGSize) -> SKSpriteNode {
        
        // Create the board object
        let board = BoardNode(color: SKColor.whiteColor(), size: size)
        board.anchorPoint = CGPointMake(0,0)
        board.position = position
        board.name = "board"
        
        // Get the boardWidth and boardHeight for portrait orientation
        let boardWidth = size.width
        let boardHeight = size.height
        
        // To fill background wood texture to the board
        var shiftx = 0
        var shifty = 0
        var backgroundTextureSize: CGFloat!
        while (shifty < Int(boardHeight)) {
            while (Int(boardWidth) > shiftx) {
                let backgroundTexture = SKSpriteNode(imageNamed: "board-default")
                backgroundTextureSize = backgroundTexture.size.width
                backgroundTexture.anchorPoint = CGPointMake(0, 0)
                backgroundTexture.position = CGPointMake(CGFloat(shiftx), CGFloat(shifty))
                backgroundTexture.zPosition = 1
                board.addChild(backgroundTexture)
                shiftx = shiftx + Int(backgroundTextureSize)
            }
            shifty = shifty + Int(backgroundTextureSize)
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
            board.addChild(line)
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
            board.addChild(line)
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
                board.addChild(star)
            }
        }
    
        return board
    }
    
    func addStone(location: CGPoint) {
        
        let location = freeLocationToFixedLocation(location)
        
        switch stoneColor {
            case .Black:
                let stone = BlackStoneNode.blackStoneAtPosition(location)
                stone.size = CGSize(width: self.frame.height/20, height: self.frame.width/20)
                stone.zPosition = 4
                self.addChild(stone)
                stoneColor = .White
            case .White:
                let stone = WhiteStoneNode.whiteStoneAtPosition(location)
                stone.size = CGSize(width: self.frame.height/20, height: self.frame.width/20)
                stone.zPosition = 5
                self.addChild(stone)
                stoneColor = .Black
        }
    }
    
    func freeLocationToFixedLocation(location: CGPoint) -> CGPoint {
        let unitWidth = self.size.width/20
        let unitHeight = self.size.height/20
        var shiftx = 0
        var shifty = 0
        var fixedLocation = location
        
        fixedLocation.x = fixedLocation.x - unitWidth/2
        fixedLocation.y = fixedLocation.y - unitHeight/2
        
        while (fixedLocation.x > 0) {
            shiftx = shiftx + 1
            fixedLocation.x = fixedLocation.x - unitWidth
            if shiftx > 19 {
                shiftx = 19
            }
        }
        
        while (fixedLocation.y > 0) {
            shifty = shifty + 1
            fixedLocation.y = fixedLocation.y - unitHeight
            if shifty > 19 {
                shifty = 19
            }
        }
        
        fixedLocation.x = unitWidth * CGFloat(shiftx)
        fixedLocation.y = unitHeight * CGFloat(shifty)
        
        return fixedLocation
    }
}