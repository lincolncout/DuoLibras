import SwiftUI

struct ContentView: View {
    @StateObject var temaViewmodel = TemaViewModel()
    
    var body: some View {
        let items = [GridItem(.flexible()), GridItem(.flexible())]
        
        NavigationStack{
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color.green.opacity(0.2))
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
            .navigationTitle("Home")
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
