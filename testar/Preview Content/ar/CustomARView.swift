//
//  CustomARView.swift
//  testar
//
//  Created by 関琢磨 on 2024/10/17.
//

import UIKit
import ARKit
import RealityKit

class ARViewController: UIViewController {
    
    private var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()
        arView = ARView(frame: view.bounds)
        let config = ARFaceTrackingConfiguration()
        arView.session.run(config, options: [])
        // この構成でセッションを実行すると、フロントカメラに切り替わります。

        let anchor = AnchorEntity(.face)
        let text = ModelEntity(mesh: .generateText(" ←", extrusionDepth: 0.01, font: .systemFont(ofSize: 0.2, weight: .bold), containerFrame: CGRect.zero, alignment: .center, lineBreakMode: .byCharWrapping))
//        let text1 = ModelEntity(mesh: .generateText(" ←1", extrusionDepth: 0.01, font: .systemFont(ofSize: 0.2, weight: .bold), containerFrame: CGRect.zero, alignment: .center, lineBreakMode: .byCharWrapping))
//        let text2 = ModelEntity(mesh: .generateText(" ←2", extrusionDepth: 0.01, font: .systemFont(ofSize: 0.2, weight: .bold), containerFrame: CGRect.zero, alignment: .center, lineBreakMode: .byCharWrapping))
//        let text3 = ModelEntity(mesh: .generateText(" ←3", extrusionDepth: 0.01, font: .systemFont(ofSize: 0.2, weight: .bold), containerFrame: CGRect.zero, alignment: .center, lineBreakMode: .byCharWrapping))
         // "Ciao!"という文字列、奥行き0.03m、システムフォント0.1m-bold、テキストの折り返しbyCharWrappingでモデルを作成。
         // containerFrameをゼロにすると、その文字列の表示に必要な大きさに文字列のコンテナが調整される。
         // コンテナフレームはモデルの原点（中心）にoriginが設定されるので、origin0だと少し右寄りになる。

         // フォントサイズは、m単位になるので、20にすると20mで表示されてしまうので注意。
        text.transform = Transform(pitch: 0, yaw: 0, roll: 0)
//        text1.transform = Transform(pitch: 0, yaw: 0, roll: -1.5707963267949)
//        text2.transform = Transform(pitch: 0, yaw: -1.5707963267949, roll: 0)
//        text3.transform = Transform(pitch: -1.5707963267949, yaw: 0, roll: 0)
        anchor.addChild(text)
//        anchor.addChild(text1)
//        anchor.addChild(text2)
//        anchor.addChild(text3)
        arView.scene.anchors.append(anchor)




        view.addSubview(arView)
    }

}
