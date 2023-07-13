import Foundation

struct KitchenCategory: Codable {
    let сategories: [FoodCategory]
}

struct FoodCategory: Codable {
    let id: Int
    let name: String
    let image_url: String
}
