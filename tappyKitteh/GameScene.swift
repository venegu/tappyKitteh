//
//  GameScene.swift
//  tappyKitteh
//
//  Created by Gale on 3/22/16.
//  Copyright (c) 2016 Gale. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var kitteh = SKSpriteNode()
    var backgroundScene = SKSpriteNode()
    
    /* NOTE TO SELF: Remember to swap out bird sprites with kittehHero */
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Adding background scene
        let backgroundTexture = SKTexture(imageNamed: "bg.png")
        backgroundScene = SKSpriteNode(texture: backgroundTexture)
        
        backgroundScene.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        backgroundScene.size.height = self.frame.height
        
        self.addChild(backgroundScene)
        
        // Adding cat (or bird atm)
        let kittehTexture1 = SKTexture(imageNamed: "flappy1.png")
        let kittehTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        // Creating animation
        let animation = SKAction.animateWithTextures([kittehTexture1, kittehTexture2], timePerFrame: 0.25)
        kitteh = SKSpriteNode(texture: kittehTexture1)
        
        // Repeating animation 
        let flapping = SKAction.repeatActionForever(animation)
        
        // Setting sprite position to middle of the phone
        kitteh.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        kitteh.runAction(flapping)
        
        // Adding node to screen
        self.addChild(kitteh)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
       
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
