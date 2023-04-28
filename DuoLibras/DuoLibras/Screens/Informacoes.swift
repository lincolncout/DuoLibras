//
//  Informacoes.swift
//  DuoLibras
//
//  Created by Student02 on 27/04/23.
//

import SwiftUI

struct Informacoes: View {
    var tema: Tema
    var body: some View {
        VStack {
            Text("Informações")
                .font(.title)
            Spacer()
            Text(tema.nome!)
            Spacer()
            Text(tema.infos.descricao!)
            Spacer()
            ForEach(tema.infos.links, id: \.self) {
                link in
                Link("\(link.titulo!)", destination: URL(string: "\(link.endereco!)")!).padding(.bottom)
                
            }
        }.padding()
    }
}
