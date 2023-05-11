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
                ScrollView(showsIndicators: false) {
                    Text("Escolha um tema para começar a praticar").font(.title3).padding()
                    LazyVGrid(columns: items) {
                        ForEach(temaViewmodel.tema, id: \._id) {
                            tema in
                            TemaView(tema: tema).padding(.bottom)
                        }
                    }
                }
            }
            .navigationTitle("DuoLibras")
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
