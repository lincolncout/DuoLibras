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
        VStack(alignment: .center) {
            Spacer()
            Text(tema.nome!)
                .font(.title)
                .navigationTitle("Informações")
            Spacer()
            AsyncImage(
                url: URL(string: tema.imagem!),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 150)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Spacer()
            Spacer()
            Text(tema.infos.descricao!)
            Spacer()
            Text("Confira os links abaixo para aprender mais:").padding(.bottom)
            ForEach(tema.infos.links, id: \.self) {
                link in
                VStack() {
                    Link("\(link.titulo!)", destination: URL(string: "\(link.endereco!)")!)
                }
                .foregroundColor(Color.white).frame(maxWidth: 350).padding().background(Color.blue).cornerRadius(15)
                
            }
        }.padding()
    }
}
