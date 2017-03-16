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
        super.init(texture: nil, color: UIColor.clear, size: size)
        self.anchorPoint = CGPoint(x: 0, y: 0)
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
                backgroundTexture.anchorPoint = CGPoint(x: 0, y: 0)
                backgroundTexture.position = CGPoint(x: CGFloat(shiftx), y: CGFloat(shifty))
                backgroundTexture.zPosition = 1
                self.addChild(backgroundTexture)
                shiftx += Int(backgroundTextureSize!)
            }
            shifty += Int(backgroundTextureSize!)
            shiftx = 0
        }
        
        // Draw 19 horizontal lines
        for i in 1...19 {
            let path: CGMutablePath = CGMutablePath()
            
            path.move(to: CGPoint(x: boardWidth/20, y: boardHeight/20*CGFloat(i)))
            path.addLine(to: CGPoint(x: boardWidth-boardWidth/20, y: boardHeight/20*CGFloat(i)))
            let line = SKShapeNode(path: path)
            line.strokeColor = SKColor.black
            line.lineWidth = 1
            line.zPosition = 2
            self.addChild(line)
        }
        
        // 19 vertical lines
        for i in 1...19 {
            let path: CGMutablePath = CGMutablePath()
            path.move(to: CGPoint(x:boardWidth/20*CGFloat(i), y: boardHeight/20))
            path.addLine(to: CGPoint(x:boardWidth/20*CGFloat(i), y:boardHeight-boardHeight/20))
            let line = SKShapeNode(path: path)
            line.strokeColor = SKColor.black
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
                star.position = CGPoint(x: boardWidth/20*x, y: boardHeight/20*y)
                star.fillColor = UIColor.black
                star.strokeColor = UIColor.black
                star.zPosition = 3
                self.addChild(star)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
