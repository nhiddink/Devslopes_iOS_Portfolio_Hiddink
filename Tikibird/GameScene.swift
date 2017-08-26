//
//  GameScene.swift
//  Tikibird
//
//  Created by Neil Hiddink on 7/4/16.
//  Copyright (c) 2016 Neil Hiddink. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let totalGroundPieces = 3
    var groundPieces = [SKSpriteNode]()
    
    override func didMoveToView(view: SKView) {
        setupScenery()
    }
    func setupScenery() {
        //Add background sprites
        let bg = SKSpriteNode(imageNamed:"Sky.png")
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg.position = CGPoint(x: 0, y: 0)
        bg.zPosition = 1
        self.addChild(bg)

        let mountains = SKSpriteNode(imageNamed: "Mountains.png")
        mountains.size = CGSize(width: self.frame.width, height: self.frame.height/4)
        mountains.position = CGPoint(x: 0, y: -self.frame.height / 2 + 200)
        mountains.zPosition = 2
        self.addChild(mountains)
        
        //Add ground sprites
        for x in 0 ..< totalGroundPieces {
            let sprite = SKSpriteNode(imageNamed: "Ground")
            sprite.physicsBody = SKPhysicsBody(rectangleOfSize: sprite.size)
            sprite.physicsBody?.dynamic = false
            sprite.zPosition = 5
            groundPieces.append(sprite)
            let wSpacing: CGFloat = -sprite.size.width / 2
            let hSpacing: CGFloat = -self.frame.height / 2 + sprite.size.height / 2
            if x == 0 {
                sprite.position = CGPoint(x: wSpacing, y: hSpacing)
            } else {
                sprite.position = CGPoint(x: -(wSpacing * 2) + groundPieces[x-1].position.x, y: groundPieces[x-1].position.y)
            }
            self.addChild(sprite)
        }
        
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
