//
//  Pergunta.swift
//  DuoLibras
//
//  Created by Student02 on 28/04/23.
//

import SwiftUI

struct PerguntaTexto: View {
    
    var opcoes: [PerguntasTema]
    var numPergunta: Int
    var acertos: Int
    @State private var progress = 1.0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ProgressView(value: progress * Double(acertos), total: 100)
                    .padding()
                
                ForEach(opcoes, id: \.self) { op in
                    Text(op.tipoPerguntas!)
                }
                YoutubeVideo(videoID: "CX-BdDHW0Ho").frame(width: 300, height: 150)
            }
        }
    }
}

//struct Pergunta_Previews: PreviewProvider {
//    static var previews: some View {
//        Pergunta()
//    }
//}
