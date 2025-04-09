import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Butuh Panduan?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .dynamicTypeSize(.small ... .xxLarge)
                                .lineLimit(1)
                                .padding(.top, 30)
                            
                            Text("Pilih jenis patah tulang untuk mendapatkan panduan pertolongan pertama.")
                                .font(.subheadline)
                                .dynamicTypeSize(.small ... .xxLarge)
                                .minimumScaleFactor(0.8)
                                .lineLimit(2)
                                .padding(.leading, 2)
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 20)
                        
                        // List opsi panduan fracture
                        VStack(spacing: 16) {
                            ForEach(listFracture) { fracture in
                                FractureCard(fracture: fracture)
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 10)
                        
                        
                        // Emergency Text Button
                        Button(action: {
                            if let url = URL(string: "tel://02125655555") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: "phone.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.red)
                                
                                Text("Hubungi Eka Hospital")
                                    .foregroundColor(.red)
                                    .underline()
                                    .font(.system(size: 20, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 25)
                            .padding()
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 5)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
