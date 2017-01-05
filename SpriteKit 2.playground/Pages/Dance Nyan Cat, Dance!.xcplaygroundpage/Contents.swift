//: # Pump up the Volume
//: Nyan Cat isn't Nyan Cat without a little tune. Start with what we had on the [previous page](@previous)

import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 320, height: 256)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)

let Chad = SKSpriteNode(imageNamed: "Chad_1Face")
Chad.position = CGPoint(x: (frame.size.width / 2.0)-50, y: frame.size.height / 2.0)
Chad.setScale(0.1)

let background = SKSpriteNode(imageNamed: "Photograph")
background.position = CGPoint(x: (frame.size.width / 2.0), y: frame.size.height / 2.0)
background.setScale(0.6)

let actionMoveUp1 = SKAction.moveBy(x: 0, y: 100, duration: 1)
let actionMoveDown1 = SKAction.moveBy(x: 0, y: -100, duration: 1)


let actionSequence1 = SKAction.sequence([actionMoveUp1, actionMoveDown1])



let actionRepeat1 = SKAction.repeatForever(actionSequence1)

Chad.run(actionRepeat1)


Chad.zPosition = 10  // Ensure sprite is above background
scene.addChild(Chad) // Add to the scene
//background.zPosition = 9
scene.addChild(background)

let emitter = SKEmitterNode()
emitter.particleLifetime = 40
emitter.particleBlendMode = SKBlendMode.alpha
emitter.particleBirthRate = 3
emitter.particleSize = CGSize(width: 4,height: 4)
emitter.particleColor = SKColor(red: 100, green: 100, blue: 255, alpha: 1)
emitter.position = CGPoint(x:frame.size.width,y:midPoint.y)
emitter.particleSpeed = 16
emitter.particleSpeedRange = 100
emitter.particlePositionRange = CGVector(dx: 0, dy: frame.size.height)
emitter.emissionAngle = 3.14
emitter.advanceSimulationTime(40)
emitter.particleAlpha = 0.5
emitter.particleAlphaRange = 0.5
scene.addChild(emitter)

class RainbowParticle : SKEmitterNode {
    
    init(childOf:SKNode,target:SKNode, color:SKColor, position:CGPoint){
        super.init()
        self.particleLifetime = 10
        self.particleBlendMode = SKBlendMode.alpha
        self.particleBirthRate = 24
        self.particleSpeed = 150
        self.emissionAngle = 3.14
        self.targetNode = target
        self.particleSize = CGSize(width: 10, height: 50)
        self.particleColor = color
        self.position = position
        childOf.addChild(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let rainbowColors = [
    SKColor(red: 255/255, green: 43/255, blue: 14/255, alpha: 1),
    SKColor(red: 255/255, green: 168/255, blue: 6/255, alpha: 1),
    SKColor(red: 255/255, green: 244/255, blue: 5/255, alpha: 1),
    SKColor(red: 51/255, green: 234/255, blue: 5/255, alpha: 1),
    SKColor(red: 8/255, green: 163/255, blue: 255/255, alpha: 1),
    SKColor(red: 8122255, green: 85/255, blue: 255/255, alpha: 1),
]

var yMultiplier : CGFloat = 0.5
for rainbowColor in rainbowColors {
    let rainbowStripe = RainbowParticle(
        childOf: scene,
        target: Chad,
        color: rainbowColor,
        position:
        CGPoint(
            x: Chad.calculateAccumulatedFrame().width * -0.3 + Chad.position.x,
            y: Chad.calculateAccumulatedFrame().height * yMultiplier + Chad.position.y
        )
    )
    yMultiplier -= 0.15
}

//: Make Nyan Cat even happier!
let actionPlaySound = SKAction.playSoundFileNamed("Photograph.mp3", waitForCompletion: false)
scene.run(actionPlaySound)

//: And show the scene in the liveView

let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view

//: OK I'm done.

