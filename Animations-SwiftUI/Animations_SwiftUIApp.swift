import SwiftUI

@main
struct Animations_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CircleLoader(color: Colors.violet, diameter: 40, thick: 8, animationDuration: 0.7)
        }
    }
}

struct Animations_SwiftUIApp_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoader(color: Colors.violet, diameter: 40, thick: 8, animationDuration: 0.7)
    }
}
