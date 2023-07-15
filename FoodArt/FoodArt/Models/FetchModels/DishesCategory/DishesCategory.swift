import Foundation

struct DishesCategory: Codable, Equatable {
    let dishes: [Dish]
}

struct Dish: Codable, Equatable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let image_url: String
}
