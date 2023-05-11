import SwiftUI

struct FinishedTema: View {
    var acertos: Int
    
    var message: String = ""
    
    var body: some View {
        VStack {
            
            Text("Título")
            Text("Textinho.. Você acertou \(acertos) pergunta(s)")
            
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                Text("Voltar para Home").foregroundColor(Color.white).frame(width: 200, height: 50).background(Color.purple.opacity(0.5)).cornerRadius(20)
            }.isDetailLink(false)
        }
    }
}

struct FinishedTema_Previews: PreviewProvider {
    static var previews: some View {
        FinishedTema(acertos: 1)
    }
}
