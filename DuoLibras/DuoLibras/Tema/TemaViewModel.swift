import Foundation

class TemaViewModel: ObservableObject {
    // Instância observavel por outras telas - atualiza na outra tela quando é modificado
    @Published var tema: [Tema] = []
    
    func fetch() {
        // API
        guard let apiUrl = URL(string: "http://192.168.128.201:1880/readTema") else { return }
        
        // Cria tarefa
        let task = URLSession.shared.dataTask(with: apiUrl) { [weak self]
            // weak self = "relação fraca", ou seja, não quebra a tela se der algum ruim, só não carregaa info
            data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let parsed = try JSONDecoder().decode([Tema].self, from: data)
                
                DispatchQueue.main.async {
                    self?.tema = parsed
                }
            } catch {
                print(error)
            }
        }
        
        // executa tarefa
        task.resume()
    }
}
