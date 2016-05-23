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
        
        let board = BoardNode(color: SKColor.whiteColor(), size: size)
        board.anchorPoint = CGPointMake(0,0)
        board.position = position
        
        var shiftx = 0
        var shifty = 0
        var backgroundTextureSize = CGFloat(0)
        
        while (shifty < Int(size.height)) {
            while (Int(size.width) > shiftx) {
                let backgroundTexture = SKSpriteNode(imageNamed: "board-default")
                backgroundTextureSize = backgroundTexture.size.width
                backgroundTexture.anchorPoint = CGPointMake(0, 0)
                backgroundTexture.position = CGPointMake(CGFloat(shiftx), CGFloat(shifty))
                board.addChild(backgroundTexture)
                shiftx = shiftx + Int(backgroundTextureSize)
            }
            shifty = shifty + Int(backgroundTextureSize)
            shiftx = 0
        }
        
        shiftx = 1
        shifty = 1
        let boardWidth = size.width
        let boardHeight = size.height
        let gridSquareWidth = boardWidth/20
        let gridSqaureHeight = boardHeight/20
        while (shifty <= 18) {
            while (shiftx <= 18) {
                let gridSquare = returnAGridSquare(gridSquareWidth, height: gridSqaureHeight)
                gridSquare.position = CGPointMake(gridSquareWidth*0.5+gridSquareWidth*CGFloat(shiftx), gridSqaureHeight*0.5+gridSqaureHeight*CGFloat(shifty))
                board.addChild(gridSquare)
                shiftx = shiftx + 1
            }
            shiftx = 1
            shifty = shifty + 1
        }
    
        return board
    }
}

func returnAGridSquare(width: CGFloat, height: CGFloat) -> SKShapeNode {
    let gridSquare = SKShapeNode(rectOfSize: CGSizeMake(width, height))
    gridSquare.zPosition = 1
    gridSquare.fillColor = SKColor.clearColor()
    gridSquare.lineWidth = 1
    gridSquare.strokeColor = SKColor.blackColor()
    
    return gridSquare
}
