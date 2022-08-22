//
//  GameSceneViewController.swift
//  primitive-shape
//
//  Created by Clarence on 24/08/22.
//

import Foundation
import SceneKit

class GameSceneViewController: UIViewController {
    private let sceneView: SCNView = .init(frame: .zero)
    private let scene = GameScene()
    
    var sideTapped: ((Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sceneView)
        
        sceneView.allowsCameraControl = true
        sceneView.cameraControlConfiguration.autoSwitchToFreeCamera = false
        
        NSLayoutConstraint.activate([
            sceneView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sceneView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sceneView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            sceneView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        sceneView.scene = scene
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: sceneView) else { return }
        guard let hitTestResult = sceneView.hitTest(touchPoint, options: nil).first else { return }
        
        let boxNode = scene.rootNode.childNode(withName: "boxNode", recursively: false)
        let cameraNode = scene.rootNode.childNode(withName: "camera", recursively: false)
        
        guard hitTestResult.node is BoxNode else {
            return
        }
        
        sideTapped?(hitTestResult.geometryIndex)
        
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        
        if let pov = sceneView.pointOfView {
            switch hitTestResult.geometryIndex {
            case 0:
                boxNode?.orientation = sceneView.pointOfView?.orientation ?? SCNQuaternion(x: 0, y: 0, z: 0, w: 0)
            case 1:
                var GLKQuat = GLKQuaternionMake(pov.orientation.x, pov.orientation.y, pov.orientation.z, pov.orientation.w)
                let multiplier = GLKQuaternionMakeWithAngleAndAxis(-.pi/2, 0, 1, 0)
                GLKQuat = GLKQuaternionMultiply(GLKQuat, multiplier)
                boxNode?.orientation = SCNQuaternion(GLKQuat.x, GLKQuat.y, GLKQuat.z, GLKQuat.w)
            case 2:
                var GLKQuat = GLKQuaternionMake(pov.orientation.x, pov.orientation.y, pov.orientation.z, pov.orientation.w)
                let multiplier = GLKQuaternionMakeWithAngleAndAxis(-.pi, 0, 1, 0)
                GLKQuat = GLKQuaternionMultiply(GLKQuat, multiplier)
                boxNode?.orientation = SCNQuaternion(GLKQuat.x, GLKQuat.y, GLKQuat.z, GLKQuat.w)
            case 3:
                var GLKQuat = GLKQuaternionMake(pov.orientation.x, pov.orientation.y, pov.orientation.z, pov.orientation.w)
                let multiplier = GLKQuaternionMakeWithAngleAndAxis(.pi/2, 0, 1, 0)
                GLKQuat = GLKQuaternionMultiply(GLKQuat, multiplier)
                boxNode?.orientation = SCNQuaternion(GLKQuat.x, GLKQuat.y, GLKQuat.z, GLKQuat.w)
            case 4:
                var GLKQuat = GLKQuaternionMake(pov.orientation.x, pov.orientation.y, pov.orientation.z, pov.orientation.w)
                let multiplier = GLKQuaternionMakeWithAngleAndAxis(.pi/2, 1, 0, 0)
                GLKQuat = GLKQuaternionMultiply(GLKQuat, multiplier)
                boxNode?.orientation = SCNQuaternion(GLKQuat.x, GLKQuat.y, GLKQuat.z, GLKQuat.w)
            case 5:
                var GLKQuat = GLKQuaternionMake(pov.orientation.x, pov.orientation.y, pov.orientation.z, pov.orientation.w)
                let multiplier = GLKQuaternionMakeWithAngleAndAxis(-.pi/2, 1, 0, 0)
                GLKQuat = GLKQuaternionMultiply(GLKQuat, multiplier)
                boxNode?.orientation = SCNQuaternion(GLKQuat.x, GLKQuat.y, GLKQuat.z, GLKQuat.w)
            default:
                return
            }
            boxNode?.scale = SCNVector3(x: 2, y: 2, z: 2)
        }
        SCNTransaction.commit()
    }
}
