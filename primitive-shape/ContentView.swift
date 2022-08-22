//
//  ContentView.swift
//  primitive-shape
//
//  Created by Clarence on 22/08/22.
//

import SceneKit
import SwiftUI

struct ContentView: View {
    let scene = SCNScene(named: "art.scnassets/ship.scn")
    
    func prepareScene() {
        print("Preparing scene")
        
        // prepare camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0.5, z: 1.4)
        
        scene?.rootNode.addChildNode(cameraNode)
        
        // prepare box
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.blue
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scene?.rootNode.addChildNode(boxNode)
        
        
        let spin = CABasicAnimation(keyPath: "rotation")
        // Use from-to to explicitly make a full rotation around z
        spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
        spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(GLKMathDegreesToRadians(360))))
        spin.duration = 3
        spin.repeatCount = .infinity
        boxNode.addAnimation(spin, forKey: "spin around")
        
        addLights()
        
        // look at the object
        let centerConstraint = SCNLookAtConstraint(target: boxNode)
        cameraNode.constraints = [centerConstraint]
    }

    func addLights() {
        let directional = SCNLight()
        directional.type = .directional
        let directionalNode = SCNNode()
        directionalNode.light = directional
        // degrees
        directionalNode.eulerAngles.x = -.pi/4
        
        scene?.rootNode.addChildNode(directionalNode)
        
        let ambient = SCNLight()
        ambient.type = .ambient
        ambient.intensity = 200
        let ambientNode = SCNNode()
        ambientNode.light = ambient
        ambient.color = UIColor.lightGray
        scene?.rootNode.addChildNode(ambientNode)
    }
    
    var body: some View {
        VStack {
            SceneView(
                scene: scene,
                options: [.allowsCameraControl, .autoenablesDefaultLighting]
            )
            .onAppear(perform: prepareScene)
            .frame(height: 250)

            Text("Hello, world!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
