import SwiftUI

struct FinishedTema: View {
    var acertos: Int
    
    @State var titulo: String = ""
    @State var message: String = ""
    
    var body: some View {
        VStack {
            
            Text(titulo)
                .font(.title)
                .foregroundColor(Color("cinza"))
                .padding()
            
            Text(message).padding().foregroundColor(Color("cinza"))
                        
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                Text("Voltar para Home").foregroundColor(Color.white).frame(width: 200, height: 50).background(Color("cinza").opacity(0.4)).cornerRadius(20)
            }.isDetailLink(false)
        }.frame(width: 300, height: 350, alignment: .center).background(Color("azul")).cornerRadius(20)
        .onAppear() {
            controlMessage()
        }
    }
    
    func controlMessage() {
        if acertos == 0 {
            self.titulo = "Que pena..."
            self.message = "Parece que você não acertou nenhuma pergunta. Mas fique tranquilo, você pode refazer o módulo sempre que quiser."
        } else if acertos >= 1 && acertos <= 2 {
            self.titulo = "Quase lá..."
            self.message = "Você acertou \(acertos) pergunta(s). Continue trabalhando duro no aprendizado de Libras. Lembre-se, você pode refazer o módulo sempre que quiser"
        } else if acertos == 3 {
            self.titulo = "Bom trabalho!"
            self.message = "Você acertou \(acertos) pergunta(s). Continue trabalhando duro no aprendizado de Libras. Lembre-se, você pode refazer o módulo sempre que quiser"
        } else if acertos == 4 {
            self.titulo = "Parabéns!"
            self.message = "Você acertou todas as questões deste módulo! Daqui a pouco está fluente!"
        }
    }
}

struct FinishedTema_Previews: PreviewProvider {
    static var previews: some View {
        FinishedTema(acertos: 1)
    }
}
