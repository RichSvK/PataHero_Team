import SwiftUI

struct FractureCard: View {
    let fracture: DataFracture
    
    var body: some View {
        NavigationLink(destination: ProcedureDetailView(
            fracture: fracture,
            procedures: getProcedures(for: fracture)
        )) {
            HStack(spacing: 12) {
                Image(fracture.imagePath)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(fracture.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .dynamicTypeSize(.small ... .xxLarge)
                        .minimumScaleFactor(0.8)
                        .lineLimit(2)
                }
                Spacer()
            }
            .padding(12)
            .background(Color("colorCard"))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
        .buttonStyle(.plain)
    }
    
    // Fungsi ini mendapatkan prosedur fracture berdasarkan id fracture
    private func getProcedures(for fracture: DataFracture) -> [FractureProcedure] {
        switch fracture.id {
        case 1: return fingerProcedure
        case 2: return armProcedure
        case 3: return wristProcedure
        default: return []
        }
    }
}

#Preview {
    FractureCard(fracture: listFracture[0])
}
