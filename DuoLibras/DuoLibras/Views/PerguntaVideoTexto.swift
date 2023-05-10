import SwiftUI

struct PerguntaVideoTexto: View {
    
    var opcoes: [PerguntasTema]
    @State var numPergunta: Int
    @State var acertos: Int
    
    var body: some View {
        HStack {
            Text("pergunta video texto")
        }
    }
}
