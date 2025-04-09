import SwiftUI

struct MultiStepProgressBar: View {
    let numberOfSteps: Int
    @Binding var currentStep: Int
    let stepLabels: [String]
    
    init(numberOfSteps: Int = 4, currentStep: Binding<Int>, stepLabels: [String] = ["Balut", "Kompres", "Periksa", "Kontak"]) {
        self.numberOfSteps = numberOfSteps
        self._currentStep = currentStep
        self.stepLabels = stepLabels
    }
    
    var body: some View {
        HStack(spacing: -5) {
            ForEach(0..<numberOfSteps, id: \.self) { step in
                VStack {
                    StepCircle(number: step, isCompleted: step <= currentStep)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                currentStep = step
                            }
                        }
                    
                    Text(stepLabels[step])
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .frame(width: 50)
                }
                
                if step < numberOfSteps - 1 {
                    ConnectingLine(isActive: step < currentStep)
                }
            }
        }
    }
}

struct StepCircle: View {
    let number: Int
    let isCompleted: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(isCompleted ? Color.redcomponent : Color.gray.opacity(0.5))
                .frame(width: 25, height: 25)
            
            Text("\(number + 1)")
                .bold(true)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .minimumScaleFactor(0.1)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ConnectingLine: View {
    let isActive: Bool
    
    var body: some View {
        Rectangle()
            .fill(isActive ? Color.red : Color.gray.opacity(0.5))
            .frame(height: 2)
            .frame(width: 60)
            .padding(.bottom, 15)
    }
}

struct MultiStepProgressBarPreview: View {
    @State private var currentStep = 0
    
    var body: some View {
        MultiStepProgressBar(numberOfSteps: 4, currentStep: $currentStep)
    }
}

#Preview {
    MultiStepProgressBarPreview()
}
