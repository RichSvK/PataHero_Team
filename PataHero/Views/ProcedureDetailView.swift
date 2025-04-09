import SwiftUI

struct ProcedureDetailView: View {
    let fracture: DataFracture
    let procedures: [FractureProcedure]
    @State private var currentIndex = 0
    @State private var dragOffset: CGFloat = 0
    @Environment(\.dismiss) var dismiss
    
    var isLastStep: Bool {
        currentIndex == procedures.count - 1
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
            
            // Card Stack
            GeometryReader { geometry in
                ZStack {
                    ForEach(0..<procedures.count, id: \.self) { index in
                        CardView(
                            procedure: procedures[index],
                            isLastStep: index == procedures.count - 1,
                            cardWidth: geometry.size.width * 0.9,
                            cardHeight: geometry.size.height * 0.65
                        )
                        // settingan buat efek slide/carousel yang bisa diswipe kanan kiri, biar lebih natural dan smooth pas diswipe
                        .offset(x: CGFloat(index - currentIndex) * (geometry.size.width + 20) + dragOffset)
                        
                        // settingan swipe card
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if currentIndex == index {
                                        dragOffset = value.translation.width
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.interactiveSpring()) {
                                        let swipeThreshold: CGFloat = 100
                                        if value.translation.width < -swipeThreshold && currentIndex < procedures.count - 1 {
                                            currentIndex += 1
                                        } else if value.translation.width > swipeThreshold && currentIndex > 0 {
                                            currentIndex -= 1
                                        }
                                        dragOffset = 0
                                    }
                                }
                        )
                        .zIndex(Double(procedures.count - index))
                    }
                }
                .frame(width: geometry.size.width)
            }
            
            // Top Section (Close Button + Progress Bar)
            VStack(spacing: 0) {
                HStack {
                    Text(fracture.name)
                        .padding(.leading, 20)
                        .padding(.top, 14)
                        .foregroundColor(.white)
                        .bold(true)
                        .dynamicTypeSize(.medium ... .xxLarge)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    // Close Button
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.top,15)
                    }
                    .padding(.trailing, 25)
                }
                .padding(.bottom, 20)
                .padding(.top, -10)
                .background(Color.redcomponent)
                
                // Progress Bar
                MultiStepProgressBar(numberOfSteps: 4, currentStep: $currentIndex, stepLabels: procedures.map({$0.progressLabel!}))
                    .padding(.top, 18)
  
                Spacer()
            }
            
            // Emergency Button
            if isLastStep {
                VStack {
                    Spacer()
                    CallButton()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ProcedureDetailView(fracture:listFracture[0],procedures:fingerProcedure)
}
