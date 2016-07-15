//
//  board.swift
//  MukGoBoard
//
//  Created by Benson Lo on 1/7/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import Foundation

enum Mark {
    case Black
    case White
    case Empty
    case Corner
    case HorizontalEdge
    case VerticalEdge
}

struct Point {
    var x: Int
    var y: Int
    var mark: Mark
}

class Kifu {
    var map: [Point]
    
    init() {
        self.map = []
        var y = 20
        var x = 0
        for _ in 0...20 {
            for _ in 0...20 {
                let markAssigned: Mark
                if (x==0 && y==0 || x==0 && y==20 || x==20 && y==0 || x==20 && y==20) {
                    markAssigned = .Corner
                } else if (x==0 || x==20) {
                    markAssigned = .VerticalEdge
                } else if (y==0 || y==20) {
                    markAssigned = .HorizontalEdge
                } else {
                    markAssigned = .Empty
                }
                
                self.map.append(Point(x: x, y: y, mark: markAssigned))
                x += 1
            }
            y -= 1
            x = 0
        }
    }
    
    func resetKifu() {
        var y = 20
        var x = 0
        var count = 0
        for _ in 0...20 {
            for _ in 0...20 {
                let markAssigned: Mark
                if (x==0 && y==0 || x==0 && y==20 || x==20 && y==0 || x==20 && y==20) {
                    markAssigned = .Corner
                } else if (x==0 || x==20) {
                    markAssigned = .VerticalEdge
                } else if (y==0 || y==20) {
                    markAssigned = .HorizontalEdge
                } else {
                    markAssigned = .Empty
                }
                
                
                self.map[count] = Point(x: x, y: y, mark: markAssigned)
                x += 1
                count += 1
            }
            y -= 1
            x = 0
        }
    }
    
    func updateMark(x x: Int, y: Int, mark: Mark) {
        for count in 0..<map.count {
            if (x == map[count].x && y == map[count].y) {
                map[count].mark = mark
            }
        }
    }
    
    func returnMark(x x: Int, y: Int) -> Mark {
        for count in 0..<map.count {
            if (x == map[count].x && y == map[count].y) {
                return map[count].mark
            }
        }
        
        return Mark.Empty
    }
    
    func printKifu() {
        var count = 0
        var boardTXT: String = ""
        for _ in 0...20 {
            for _ in 0...20 {
                switch map[count].mark {
                    case .Black: boardTXT += "X "
                    case .White: boardTXT += "O "
                    case .Empty: boardTXT += ". "
                    case .Corner: boardTXT += "+ "
                    case .HorizontalEdge: boardTXT += "- "
                    case .VerticalEdge: boardTXT += "| "
                }
                count += 1
            }
            boardTXT += "\n"
        }
        print(boardTXT)
    }
}