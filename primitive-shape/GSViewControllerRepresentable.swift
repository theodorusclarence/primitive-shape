//
//  GSViewControllerRepresentable.swift
//  primitive-shape
//
//  Created by Clarence on 24/08/22.
//

import SceneKit
import SwiftUI

struct GSViewControllerRepresentable: UIViewControllerRepresentable {
    let sideTapped: ((Int) -> Void)?

    func makeUIViewController(context: Context) -> GameSceneViewController {
        let vc = GameSceneViewController()
        vc.sideTapped = sideTapped
        return vc
    }

    func updateUIViewController(_ uiViewController: GameSceneViewController, context: Context) {}
}
