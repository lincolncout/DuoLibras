import Foundation

struct Tema: Codable {
    var _id: String?
    var _rev: String?
    var nome: String?
    var imagem: String?
    var infos: InfosTema
}

struct InfosTema: Codable {
    var descricao: String?
    var links: [VideosTema]
}

struct VideosTema: Codable, Hashable {
    var titulo: String?
    var endereco: String?
}
