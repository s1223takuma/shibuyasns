//
//  ContentView.swift
//  testar
//
//  Created by 関琢磨 on 2024/10/17.
//

import SwiftUI


struct ContentView: View {
    @State var isShowLogin = false
    var authenticationManager = AuthenticationManager()
    var body: some View {
        VStack {
            if authenticationManager.isSignIn == false {
                //ログインしていないとき
                VStack{
                    Spacer()
                    Button("ログイン") {
                        isShowLogin .toggle()
                    }
                    Spacer()
                }
            }else{
                //ログインしているとき
                MainView()
            }
            Spacer()
                .sheet(isPresented: $isShowLogin) {
                    LoginView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
