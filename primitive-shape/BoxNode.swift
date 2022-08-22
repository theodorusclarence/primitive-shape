//
//  BoxNode.swift
//  primitive-shape
//
//  Created by Clarence on 24/08/22.
//

import Foundation
import SceneKit

class BoxNode: SCNNode {
    override init() {
        let length: CGFloat = 5
        let box = SCNBox(width: length, height: length, length: length, chamferRadius: 0)

        box.materials = [UIColor.red, .yellow, .green, .blue, .purple, .brown].map {
            let material = SCNMaterial()
            material.diffuse.contents = $0
            material.isDoubleSided = true
            material.transparencyMode = .aOne
            return material
        }

        super.init()

        self.geometry = box
        self.name = "boxNode"
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
