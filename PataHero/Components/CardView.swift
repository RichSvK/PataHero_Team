import SwiftUI

struct CardView: View {
    let procedure: FractureProcedure    
    let isLastStep: Bool
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
    private let horizontalPadding: CGFloat = 35
    private let imageTopPadding: CGFloat = 50
    private let textTopPadding: CGFloat = 20
    private let cardTopPadding: CGFloat = 130
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Image Area (gambar prosedur)
            if !procedure.imagePath.isEmpty {
                Image(procedure.imagePath)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: cardWidth * 0.8,
                        height: cardHeight * 0.7)
                    .clipped()
                    .cornerRadius(25)
                    .padding(.top, imageTopPadding)
                    .padding(.horizontal, 5)
            }
            
            // Penjelasan prosedur
            VStack(spacing: 0) {
                Spacer().frame(height: textTopPadding)
                
                Text(procedure.step)
                    .font(.title3)
                    .fontWeight(.regular)
                    .dynamicTypeSize(.small ... .xLarge)
                    .minimumScaleFactor(0.8)
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
            .padding(.horizontal, horizontalPadding)
            .frame(height: cardHeight * 0.3)
        }
        .frame(width: cardWidth, height: cardHeight)
        .background(Color("colorCard"))
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.top, cardTopPadding)
    }
}

#Preview {
    CardView(procedure: armProcedure[2], isLastStep: false, cardWidth: UIScreen.main.bounds.width - 40, cardHeight: UIScreen.main.bounds.height - 240)
}
