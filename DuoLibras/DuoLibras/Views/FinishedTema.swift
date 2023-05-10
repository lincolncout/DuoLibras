import SwiftUI

struct FinishedTema: View {
    var acertos: Int
    var body: some View {
        HStack {
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                Image(systemName: "xmark")
                    .foregroundColor(Color.gray)
            }.isDetailLink(false)
            Text("PARABÉNS CARAI")
            Text("Acertos: \(acertos)")
        }

    }
}

struct FinishedTema_Previews: PreviewProvider {
    static var previews: some View {
        FinishedTema(acertos: 1)
    }
}
