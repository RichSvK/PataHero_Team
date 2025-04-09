import SwiftUI

struct CallButton: View{
    var body: some View{
        Button(action: {
            if let url = URL(string: "tel://02125655555") {
                UIApplication.shared.open(url)
            }
        }) {
            HStack(spacing: 12) {
                Image(systemName: "phone.fill")
                    .font(.system(size: 20))
                
                Text("Hubungi Eka Hospital")
                    .font(.system(size: 20, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 25)
            .padding()
            .background(.redcomponent)
            .cornerRadius(30)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 30)
    }
}

#Preview {
    CallButton()
}
