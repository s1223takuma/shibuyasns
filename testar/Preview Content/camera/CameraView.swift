import SwiftUI

struct CameracontentView: View {
    @State private var isPresentedCameraView = false
    
    @State private var image: UIImage?

    var body: some View {
        VStack {
            Button {
                isPresentedCameraView = true
            } label: {
                Text("カメラ表示")
            }
            
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
        }
        .fullScreenCover(isPresented: $isPresentedCameraView) {
            CameraView(image: $image).ignoresSafeArea()
        }
    }
}
struct CameracontentView_Previews: PreviewProvider {
    static var previews: some View {
        CameracontentView()
    }
}
