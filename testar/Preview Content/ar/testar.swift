//
//  testar.swift
//  testar
//
//  Created by 関琢磨 on 2024/11/12.
//

import SwiftUI
import RealityKit


struct ARViewControllerContainer: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewControllerContainer>) -> UIViewController {
        let viewController = ARViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ARViewControllerContainer>) {
    }
    
    func makeCoordinator() -> ARViewControllerContainer.Coordinator {
        return Coordinator()
    }
    
    class Coordinator {
        
    }
}


