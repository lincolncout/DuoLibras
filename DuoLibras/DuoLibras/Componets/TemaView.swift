//
//  TemaView.swift
//  DuoLibras
//
//  Created by Student02 on 27/04/23.
//

import SwiftUI

struct TemaView: View {
    var tema: Tema
    var body: some View {
        VStack {
            NavigationLink(destination: Informacoes(tema: tema)) { //provisorio
                AsyncImage(
                    url: URL(string: tema.imagem!),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 70)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
            HStack {
                Text(tema.nome!)
                    .foregroundColor(Color.white)
                NavigationLink(destination: Informacoes(tema: tema)) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color.white)
                }
            }
        }.frame(width: 120, height: 120).background(Color.cyan).cornerRadius(15)
    }
}

