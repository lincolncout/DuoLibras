import Foundation

struct Tema: Codable {
    var _id: String?
    var _rev: String?
    var nome: String?
    var imagem: String?
    var infos: InfosTema
    var perguntas: [PerguntasTema]
}

struct InfosTema: Codable {
    var descricao: String?
    var links: [VideosTema]
}

struct VideosTema: Codable, Hashable {
    var titulo: String?
    var endereco: String?
}

struct PerguntasTema: Codable, Hashable {
    var tipoPerguntas: String?
    var textoPerguntas: String?
    var imagemPerguntas: String?
    var videoPerguntas: String?
    var opcoesObjeto: OpcoesTema
}

struct OpcoesTema: Codable, Hashable {
    var tipoOpcoes: String?
    var opcoes: [Opcoes]
}

struct Opcoes: Codable, Hashable {
    var opcoesCorreta: String?
    var textoOpcoes: String?
    var imagemOpcoes: String?
    var videoOpcoes: String?
}
