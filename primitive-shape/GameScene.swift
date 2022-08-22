//
//  GameScene.swift
//  primitive-shape
//
//  Created by Clarence on 24/08/22.
//

import Foundation
import SceneKit

class GameScene: SCNScene {
    
    override init() {
        super.init()
        
        let cubeNode = BoxNode()
        self.rootNode.addChildNode(cubeNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 30)
        cameraNode.name = "camera"
        self.rootNode.addChildNode(cameraNode)
        
//        let xAngle = SCNMatrix4MakeRotation(.pi / 3.8, 1, 0, 0)
//        let zAngle = SCNMatrix4MakeRotation(-.pi / 4, 0, 0, 1)
//        cubeNode.pivot = SCNMatrix4Mult(SCNMatrix4Mult(xAngle, zAngle), cubeNode.transform)
//        
//        // Rotate the cube
//        let animation = CAKeyframeAnimation(keyPath: "rotation")
//        animation.values = [SCNVector4(1, 1, 0.3, 0 * .pi),
//                            SCNVector4(1, 1, 0.3, 1 * .pi),
//                            SCNVector4(1, 1, 0.3, 2 * .pi)]
//        animation.duration = 5
//        animation.repeatCount = HUGE
//        cubeNode.addAnimation(animation, forKey: "rotation")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
