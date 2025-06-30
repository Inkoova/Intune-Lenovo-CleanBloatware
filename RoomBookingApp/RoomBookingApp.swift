import SwiftUI

struct Room: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let price: Double
}

class RoomData: ObservableObject {
    @Published var rooms: [Room] = []

    init() {
        let calendar = Calendar.current
        let today = Date()
        // Generate sample rooms for the next 30 days
        for i in 0..<30 {
            if let date = calendar.date(byAdding: .day, value: i, to: today) {
                rooms.append(Room(name: "Sala \(i % 5 + 1)", date: date, price: Double(50 + i)))
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var data = RoomData()
    var body: some View {
        NavigationView {
            List(data.rooms) { room in
                NavigationLink(destination: RoomDetailView(room: room)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(room.name)
                                .font(.headline)
                            Text("Fecha: \(formattedDate(room.date))")
                                .font(.subheadline)
                        }
                        Spacer()
                        Text("$\(Int(room.price))")
                    }
                }
            }
            .navigationTitle("Salas disponibles")
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct RoomDetailView: View {
    let room: Room

    var body: some View {
        VStack(spacing: 20) {
            Text(room.name)
                .font(.largeTitle)
            Text("Fecha: \(formattedDate(room.date))")
                .font(.title2)
            Text("Precio: $\(Int(room.price))")
                .font(.title3)
            Spacer()
            Button(action: reserveRoom) {
                Text("Reservar por $\(Int(room.price))")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            Button(action: bidForRoom) {
                Text("Pujar en subasta")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(room.name)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    private func reserveRoom() {
        // Aquí iría la lógica de reserva
        print("Sala reservada")
    }

    private func bidForRoom() {
        // Aquí iría la lógica de subasta
        print("Oferta realizada")
    }
}

@main
struct RoomBookingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
