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
        board.name = "board"
        
        // To draw background wood texture to the board
        var shiftx = 0
        var shifty = 0
        var backgroundTextureSize = CGFloat(0)
        while (shifty < Int(size.height)) {
            while (Int(size.width) > shiftx) {
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
        
        // To draw the 19x19 square on the board
        shiftx = 1
        shifty = 1
        let boardWidth = size.width
        let boardHeight = size.height
        let gridSquareWidth = boardWidth/20
        let gridSqaureHeight = boardHeight/20
        while (shifty < 19) {
            while (shiftx < 19) {
                let gridSquare = SKShapeNode(rectOfSize: CGSizeMake(gridSquareWidth, gridSqaureHeight))
                gridSquare.zPosition = 2
                gridSquare.fillColor = SKColor.clearColor()
                gridSquare.lineWidth = 1
                gridSquare.strokeColor = SKColor.blackColor()
                gridSquare.position = CGPointMake(gridSquareWidth*0.5+gridSquareWidth*CGFloat(shiftx), gridSqaureHeight*0.5+gridSqaureHeight*CGFloat(shifty))
                board.addChild(gridSquare)
                shiftx = shiftx + 1
            }
            shiftx = 1
            shifty = shifty + 1
        }
    
        return board
    }
    
    func addStone(location: CGPoint) {
        
        let location = locationToCoordinate(location)
        
        switch stoneColor {
            case .Black:
                let stone = BlackStoneNode.blackStoneAtPosition(location)
                stone.size = CGSize(width: self.frame.height/20, height: self.frame.width/20)
                self.addChild(stone)
                stoneColor = .White
            case .White:
                let stone = WhiteStoneNode.whiteStoneAtPosition(location)
                stone.size = CGSize(width: self.frame.height/20, height: self.frame.width/20)
                    self.addChild(stone)
            stoneColor = .Black
        }
    }
    
    func locationToCoordinate(location: CGPoint) -> CGPoint {
        let unitWidth = self.size.width/20
        let unitHeight = self.size.height/20
        var shiftx = 0
        var shifty = 0
        var coordinate = location
        
        while (coordinate.x > 0) {
            shiftx = shiftx + 1
            coordinate.x = coordinate.x - unitWidth
            if shiftx > 19 {
                shiftx = 19
            }
        }
        
        while (coordinate.y > 0) {
            shifty = shifty + 1
            coordinate.y = coordinate.y - unitHeight
            if shifty > 19 {
                shifty = 19
            }
        }
        
        coordinate.x = unitWidth * CGFloat(shiftx)
        coordinate.y = unitHeight * CGFloat(shifty)
        
        return coordinate
    }
}