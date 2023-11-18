import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var singaporeTime = ""
    @State private var uaeTime = ""
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .all)
            HStack {
                VStack {
                    Text("🇸🇬 SG")
                        .font(.system(size: 48))
                    Text(singaporeTime)
                        .font(.system(size: 70, weight: .bold, design: .monospaced))
                }
                .frame(maxWidth: .infinity)
                Rectangle()
                    .frame(width: 5)
                    .padding()
                    .opacity(0.5)
                VStack {
                    Text("🇦🇪 UAE")
                        .font(.system(size: 48))
                    Text(uaeTime)
                        .font(.system(size: 70, weight: .bold, design: .monospaced))
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(.white)
        }
        .onReceive(timer) { _ in
            updateTimes()
        }
    }
    
    func updateTimes() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm:ss a"
        
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 8 * 3600) // Singapore Time
        singaporeTime = dateFormatter.string(from: Date())
        
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 4 * 3600) // UAE Time
        uaeTime = dateFormatter.string(from: Date())
    }
}
