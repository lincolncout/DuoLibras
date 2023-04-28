import SwiftUI

struct ContentView: View {
    @StateObject var temaViewmodel = TemaViewModel()
    
    var body: some View {
        let items = [GridItem(.flexible()), GridItem(.flexible())]

        NavigationStack{
            VStack {
                Text("Home")
                    .font(.title)
                Spacer()
                Text("Escolha um tema para começar a praticar")
                Spacer()
                LazyVGrid(columns: items) {
                    ForEach(temaViewmodel.tema, id: \._id) {
                        tema in
                        TemaView(tema: tema).padding(.bottom)
                    }
                }
            }
            .padding()
            .onAppear() {
                temaViewmodel.fetch()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
