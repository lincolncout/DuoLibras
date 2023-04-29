//
//  Pergunta.swift
//  DuoLibras
//
//  Created by Student02 on 28/04/23.
//

import SwiftUI
import AVKit

struct PerguntaVideoTexto: View {
    
    var opcoes: [PerguntasTema]
    var numPergunta: Int
    var acertos: Int
    
    @State private var perguntaAtual: PerguntasTema?
    
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
            
            Text(perguntaAtual!.textoPerguntas!)
            
            VideoPlayer(player: AVPlayer(url:  URL(string: "\(String(describing: perguntaAtual!.videoPerguntas))")!))
                .frame(width: 300, height: 150)
            
            
            ForEach(perguntaAtual!.opcoesObjeto.opcoes, id: \.self) { op in
                HStack {
                    Image(systemName: "hand.app.fill")
                        .foregroundColor(Color.gray)
                }
            }
        }.onAppear() {
            self.perguntaAtual = opcoes[numPergunta]
        }
    }
}
