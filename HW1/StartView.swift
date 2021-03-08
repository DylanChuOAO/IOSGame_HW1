

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("猜燈謎")
                    .foregroundColor(Color(red: 0.8, green: 0.2, blue: 0.3))
                    .bold()
                    .offset(x: 0, y: -275)
                NavigationLink(destination: ContentView()){
                    Text("點我開始")
                        .font(.custom("DFXingKai-W5-WINP-BF", size: 40))
                        .frame(width: 300, height: 50)
                        .background(Image("firecrack"))
                        .foregroundColor(.white)
                        .cornerRadius(100)
                }
            }
            .background(Image("bg").resizable()
            .frame(width: 800, height: 1200, alignment: .center))
        }.onAppear{
        }
        .preferredColorScheme(.dark)
                
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
