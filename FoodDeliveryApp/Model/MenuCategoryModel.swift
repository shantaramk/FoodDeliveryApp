
import Foundation
struct MenuCategoryModel : Codable, InfoModelProtocol {
	let id : String?
	let category : String?
	let menu : [Menu]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case category = "Category"
		case menu = "menu"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		menu = try values.decodeIfPresent([Menu].self, forKey: .menu)
	}

}


struct Menu : Codable {
   // let id : Int?
    let name : String?
    let description : String?
   // let amount : String?
   // let qty : String?
    let image: String?

    enum CodingKeys: String, CodingKey {

      //  case id = "id"
        case name = "name"
        case description = "description"
      //  case amount = "amount"
      //  case qty = "qty"
        case image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
      //  id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
      //  amount = try values.decodeIfPresent(String.self, forKey: .amount)
      //  qty = try values.decodeIfPresent(String.self, forKey: .qty)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
