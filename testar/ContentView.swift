//
//  ContentView.swift
//  testar
//
//  Created by 関琢磨 on 2024/10/17.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        ARViewControllerContainer()
            .edgesIgnoringSafeArea(.all) // 全画面表示
    }
}

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


