import SwiftUI

struct TemaView: View {
    var tema: Tema
    @State private var showInfo = false
    var body: some View {
        VStack {
            NavigationLink(destination: chooseView().navigationBarBackButtonHidden(true) ) {
                AsyncImage(
                    url: URL(string: tema.imagem!),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 80)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
            HStack {
                Text(tema.nome!)
                    .foregroundColor(Color.white)
                Button(action: {
                    showInfo.toggle()
                }) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color.white)
                }.sheet(isPresented: $showInfo) {
                    Informacoes(tema: tema)
                }
            }
        }.frame(width: 150, height: 150).background(Color.cyan).cornerRadius(15)
    }
    
   func chooseView() -> AnyView {
        if tema.perguntas[0].tipoPerguntas == "texto" && tema.perguntas[0].opcoesObjeto.tipoOpcoes == "video" {
            return AnyView(PerguntaTextoVideo(opcoes: tema.perguntas, numPergunta: 0, acertos: 0))
        } else if tema.perguntas[0].tipoPerguntas == "video" && tema.perguntas[0].opcoesObjeto.tipoOpcoes == "texto" {
            return AnyView(PerguntaVideoTexto(opcoes: tema.perguntas, numPergunta: 0, acertos: 0))
        }
        return AnyView(ContentView())
    }
}

