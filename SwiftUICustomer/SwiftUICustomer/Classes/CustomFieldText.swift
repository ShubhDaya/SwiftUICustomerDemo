import SwiftUI

struct CustomFieldText: View {
@Binding var name: String
var label: String
var required: Bool = true
var indicator: Bool = false
@State private var onKeyIn = false

var body: some View {
    ZStack {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                if required {
                    Text("*")
                }
                Spacer()
            }
            .multilineTextAlignment(.leading)
            .font(.custom("ZonaPro-SemiBold", size: self.onKeyIn || self.name != "" ? 14 : 18))
            .foregroundColor(.white)
            .offset(y: self.onKeyIn || self.name != "" ? -30 : 0)
            .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0))
            
            Rectangle().frame(height: 3)
                .cornerRadius(10)
                .foregroundColor(Color(#colorLiteral(red: 0.8392156863, green: 0.8784313725, blue: 0.8784313725, alpha: 1)))
        }
        VStack {
            TextField(self.name, text: self.$name)
                .font(.custom("ZonaPro-SemiBold", size: 18))
                .autocapitalization(.none)
                .textContentType(.nickname)
                .foregroundColor(.white)
                .padding(.bottom, 15)
                .padding(.top, 5)
                .onTapGesture {
                    self.onKeyIn = true
                }
            .zIndex(1)
        }
        
        VStack {
            if indicator && self.name.count > 0 {
                HStack {
                    Spacer()
                    Text("Verifying")
                        .font(.custom("ZonaPro-Light", size: 10))
                        .foregroundColor(Color.white)
                }
            }
        }
    }
}
    
 
}


extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}
