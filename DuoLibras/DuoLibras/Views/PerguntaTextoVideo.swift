import SwiftUI
import AVKit

struct PerguntaTextoVideo: View {
    
    var opcoes: [PerguntasTema]
    var numPergunta: Int
    var acertos: Int
        
    @State private var progress = 1.0
    @State private var close = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.gray)
                    }
                    ProgressView(value: progress * Double(acertos) * 25, total: 100).padding()
                }.padding()
                
            }
            
            Text(opcoes[numPergunta].textoPerguntas!)
            
            ForEach(opcoes[numPergunta].opcoesObjeto.opcoes, id: \.self) { op in
                HStack {
                    Image(systemName: "hand.app.fill")
                        .foregroundColor(Color.gray)
                    VideoPlayer(player: AVPlayer(url:  URL(string: "\(op.videoOpcoes!)")!))
                        .frame(width: 300, height: 150)
                }
            }
        }
    }
}
