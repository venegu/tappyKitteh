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
    var ground = SKNode()
    
    /* NOTE TO SELF: Remember to swap out bird sprites with kittehHero */
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Adding background scene
        let backgroundTexture = SKTexture(imageNamed: "bg.png")
        
        let moveBackgroundSceneLeft = SKAction.moveByX(-backgroundTexture.size().width, y: 0, duration: 9)
        let replaceBackgroundScene = SKAction.moveByX(backgroundTexture.size().width, y: 0, duration: 0)
        let moveBackgroundSceneRepeat = SKAction.repeatActionForever(SKAction.sequence([moveBackgroundSceneLeft, replaceBackgroundScene]))
        
        for index in 0...2 {
            // Setting background scene & kitteh zPosition so the image doesn't flicker
            backgroundScene.zPosition = -1
            kitteh.zPosition = 1
            
            backgroundScene = SKSpriteNode(texture: backgroundTexture)
            backgroundScene.position = CGPoint(x: backgroundTexture.size().width/2 + backgroundTexture.size().width * CGFloat(index), y: CGRectGetMidY(self.frame))
            backgroundScene.size.height = self.frame.height
            backgroundScene.runAction(moveBackgroundSceneRepeat)
            
            self.addChild(backgroundScene)
        }
        
        // Adding sprite
        let kittehTexture1 = SKTexture(imageNamed: "flappy1.png")
        let kittehTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        // Creating animation
        let flappingAnimation = SKAction.animateWithTextures([kittehTexture1, kittehTexture2], timePerFrame: 0.25)
        kitteh = SKSpriteNode(texture: kittehTexture1)
        
        // Repeating animation 
        let repeatedFlappingAnimation = SKAction.repeatActionForever(flappingAnimation)
        
        // Setting sprite position to middle of the phone
        kitteh.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        kitteh.runAction(repeatedFlappingAnimation)
        
        // Physics to make sprite fall
        kitteh.physicsBody = SKPhysicsBody(circleOfRadius: kittehTexture1.size().height/2)
        kitteh.physicsBody?.dynamic = true
        
        // Ground for the sprite to fall on
        ground.position = CGPointMake(0, 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ground.physicsBody?.dynamic = false
        
        // Adding node to screen
        self.addChild(kitteh)
        self.addChild(ground)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        kitteh.physicsBody?.velocity = CGVectorMake(0, 0)
        kitteh.physicsBody?.applyImpulse(CGVectorMake(0, 50))
        
       
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
