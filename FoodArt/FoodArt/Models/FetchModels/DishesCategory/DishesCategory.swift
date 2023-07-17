import Foundation

struct DishesCategory: Codable, Hashable {
    let dishes: [Dish]
}

struct Dish: Codable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let image_url: String
    let tegs: [String]
}
