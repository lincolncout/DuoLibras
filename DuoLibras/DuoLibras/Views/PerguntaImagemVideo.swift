import SwiftUI
import AVKit

struct PerguntaImagemVideo: View {
    
    var letrasOptions = OptionsArray()
    
    var opcoes: [PerguntasTema]
    @State var numPergunta: Int
    @State var acertos: Int
    
    
    @State var isLast: Bool = false
    @State var nextPage: Bool = false
    
    @State private var showPopup = false
    
    @State private var isSelected =  -1
    @State private var isSelectedAnswer =  "False"
    
    @State private var progress = 1.0
    @State private var close = false
    
    @State private var titleModal: String = ""
    @State private var messageModal: String = ""
    @State private var buttonModal: String = "Próxima"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            NavigationLink("",
                           destination: chooseView(pergunta: numPergunta),
                           isActive: $nextPage)
            VStack {
                HStack {
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.gray)
                    }.isDetailLink(false)
                    ProgressView(value: progress * Double(numPergunta) * 25, total: 100).padding()
                }.padding([.top, .leading, .trailing])
                
            }
            
            Text(opcoes[numPergunta].textoPerguntas!).padding()
            
            if(opcoes[numPergunta].imagemPerguntas != ""){
                AsyncImage(
                    url: URL(string: opcoes[numPergunta].imagemPerguntas!),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 120)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
            
            ForEach(Array(opcoes[numPergunta].opcoesObjeto.opcoes.enumerated()), id: \.offset) { index, op  in
                HStack {
                    Button(action: {
                        self.isSelected =  op.hashValue
                        self.isSelectedAnswer = op.opcoesCorreta!
                    }) {
                        chooseImage(numQuest: op.hashValue, index: index)
                    }
                    if(op.videoOpcoes != ""){
                        VideoPlayer(player: AVPlayer(url:  URL(string: "\(op.videoOpcoes!)")!))
                            .frame(width: 265, height: 149)
                    }
                    
                }.frame(width: 340, height: 180).background(Color.cyan.opacity(0.5)).cornerRadius(20)
            }
            
            Button("Conferir") {
                self.showPopup = true
                self.isSelected = -1
                if numPergunta == 3 {
                    self.isLast = true
                }
                else {
                    self.numPergunta = numPergunta + 1
                }
                if isSelectedAnswer == "True" {
                    self.acertos =  acertos + 1
                    self.titleModal = "Parabéns"
                    self.messageModal = "Você acertou essa pergunta!"
                } else {
                    self.titleModal = "Que pena..."
                    self.messageModal = "Você errou essa pergunta."
                }
            }.buttonStyle(.borderedProminent).padding()
            
        }.alert(isPresented: $showPopup) {
            Alert(title: Text("\(titleModal)"), message: Text("\(messageModal)"), dismissButton: .default(Text("\(buttonModal)"), action: {
                self.nextPage = true
            })
            )
        }
    }
    
    func chooseImage(numQuest: Int, index: Int) -> some View {
        
        if isSelected == numQuest {
            
            return Image(letrasOptions.images[index])
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundColor(Color.white).padding(3)
                .overlay(
                    Capsule()
                        .stroke(.blue, lineWidth: 2)
                )
            
        } else {
            
            return Image(letrasOptions.images[index])
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundColor(Color.white).padding(3)
                .overlay(
                    Capsule()
                        .stroke(.gray, lineWidth: 2)
                )
        }
    }
    
    func chooseView(pergunta: Int) -> AnyView {
            if isLast {
                return AnyView(FinishedTema(acertos: acertos).navigationBarBackButtonHidden(true))
            } else {
                if opcoes[pergunta].tipoPerguntas == "texto" && opcoes[pergunta].opcoesObjeto.tipoOpcoes == "video" {
                    return AnyView(PerguntaTextoVideo(opcoes: opcoes, numPergunta: pergunta, acertos: acertos).navigationBarBackButtonHidden(true))
                } else if opcoes[pergunta].tipoPerguntas == "video" && opcoes[pergunta].opcoesObjeto.tipoOpcoes == "texto" {
                    return AnyView(PerguntaVideoTexto(opcoes: opcoes, numPergunta: pergunta, acertos: acertos).navigationBarBackButtonHidden(true))
                } else if(opcoes[pergunta].tipoPerguntas == "video" && opcoes[pergunta].opcoesObjeto.tipoOpcoes == "imagem"){
                    // return AnyView(PerguntaVideoImagem(opcoes: tema.perguntas, numPergunta: 0, acertos: 0))
                }
                else if(opcoes[pergunta].tipoPerguntas == "imagem" && opcoes[pergunta].opcoesObjeto.tipoOpcoes == "texto"){
                    // return AnyView(PerguntaImagemTexto(opcoes: tema.perguntas, numPergunta: 0, acertos: 0))
                }
                else if(opcoes[pergunta].tipoPerguntas == "imagem" && opcoes[pergunta].opcoesObjeto.tipoOpcoes == "video"){
                    return AnyView(PerguntaImagemVideo(opcoes: opcoes, numPergunta: pergunta, acertos: acertos).navigationBarBackButtonHidden(true))
                }
            }
            
            return AnyView(ContentView().navigationBarBackButtonHidden(true))
        }
}