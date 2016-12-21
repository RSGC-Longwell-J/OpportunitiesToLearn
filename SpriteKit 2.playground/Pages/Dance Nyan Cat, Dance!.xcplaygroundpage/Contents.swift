//: # Pump up the Volume
//: Nyan Cat isn't Nyan Cat without a little tune. Start with what we had on the [previous page](@previous)

import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 320, height: 256)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)

let nyanCat = SKSpriteNode(imageNamed: "Chad_1Face")
nyanCat.position = CGPoint(x: (frame.size.width / 2.0)-50, y: frame.size.height / 2.0)
nyanCat.setScale(0.1)

let background = SKSpriteNode(imageNamed: "Photograph")
background.position = CGPoint(x: (frame.size.width / 2.0)-50, y: frame.size.height / 2.0)

let actionMoveUp1 = SKAction.moveBy(x: 0, y: 100, duration: 1)
let actionMoveDown1 = SKAction.moveBy(x: 0, y: -100, duration: 1)
let actionMoveUp2 = SKAction.moveBy(x: 0, y: -100, duration: 1)
let actionMoveDown2 = SKAction.moveBy(x: 0, y: 100, duration: 1)

let actionSequence1 = SKAction.sequence([actionMoveUp1, actionMoveDown1])

let actionSequence2 = SKAction.sequence([actionMoveUp2, actionMoveDown2])

let actionRepeat1 = SKAction.repeatForever(actionSequence1)
let actionRepeat2 = SKAction.repeatForever(actionSequence2)
nyanCat.run(actionRepeat1)

nyanCat.run(actionRepeat2)
nyanCat.zPosition = 10  // Ensure sprite is above background
scene.addChild(nyanCat) // Add to the scene

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
        target: nyanCat,
        color: rainbowColor,
        position:
        CGPoint(
            x: nyanCat.calculateAccumulatedFrame().width * -0.3 + nyanCat.position.x,
            y: nyanCat.calculateAccumulatedFrame().height * yMultiplier + nyanCat.position.y
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

