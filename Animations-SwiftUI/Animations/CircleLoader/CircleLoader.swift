import SwiftUI

struct CircleLoader: View {
    
    let diameter: CGFloat!
    let thick: CGFloat!
    let loadingColor: LinearGradient!
    let animationDuration: Double!
    let rotationsCount: Double = 3
    
    var loaderStartPoint: CGFloat = 0.15
    @State var loaderEndPoint: CGFloat = 0.325
    
    @State var rotationDegree = Angle.degrees(0)
    
    init(color: Color, diameter: CGFloat, thick: CGFloat, animationDuration: Double) {
        self.loadingColor = LinearGradient(gradient: .init(colors: [color,
                                                                    color.opacity(0.5)]),
                                           startPoint: .top,
                                           endPoint: .bottom)
        self.diameter = diameter
        self.thick = thick
        self.animationDuration = animationDuration
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: thick))
                .fill(Colors.lightGray)
            Circle()
                .trim(from: loaderStartPoint, to: loaderEndPoint)
                .stroke(style: StrokeStyle(lineWidth: thick, lineCap: .butt))
                .fill(loadingColor)
                .rotationEffect(self.rotationDegree)
        }.frame(width: diameter, height: diameter)
        .onAppear() {
            self.animateLoader()
            Timer.scheduledTimer(withTimeInterval: self.rotationsCount * self.animationDuration + (self.animationDuration), repeats: true) {_ in
                self.animateLoader()
            }
        }
    }
    
    func getRotationAngle() -> Angle {
        return .degrees(360 * self.rotationsCount) + .degrees(45)
    }
    
    func animateLoader() {
        withAnimation(Animation.spring(response: animationDuration * 2 )) {
            self.rotationDegree = .degrees(-45)
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
            withAnimation(Animation.easeInOut(duration: self.rotationsCount * self.animationDuration)) {
                self.rotationDegree += self.getRotationAngle()
                self.loaderEndPoint = 0.9
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: rotationsCount * animationDuration, repeats: false) { _ in
            self.rotationDegree = .degrees(45)
            withAnimation(Animation.easeOut(duration: self.animationDuration)) {
                self.loaderEndPoint = 0.325
            }
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoader(color: Colors.violet, diameter: 40, thick: 8, animationDuration: 0.7)
    }
}
