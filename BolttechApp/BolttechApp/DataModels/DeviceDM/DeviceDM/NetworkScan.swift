/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NetworkScan : Codable {
	let best_type : String?
	let best_category : String?
	let best_make : String?
	let best_model : String?
	let best_os : String?
	let recog_rank : Int?
	let is_family : Bool?
	let best_name : String?
	let mac_address : String?
	let vendor : String?
	let ip_addresses : [String]?
	let state : String?
	let first_seen_timestamp : String?
	let netbios : Netbios?
	let bonjour : Bonjour?

	enum CodingKeys: String, CodingKey {

		case best_type = "best_type"
		case best_category = "best_category"
		case best_make = "best_make"
		case best_model = "best_model"
		case best_os = "best_os"
		case recog_rank = "recog_rank"
		case is_family = "is_family"
		case best_name = "best_name"
		case mac_address = "mac_address"
		case vendor = "vendor"
		case ip_addresses = "ip_addresses"
		case state = "state"
		case first_seen_timestamp = "first_seen_timestamp"
		case netbios = "netbios"
		case bonjour = "bonjour"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		best_type = try values.decodeIfPresent(String.self, forKey: .best_type)
		best_category = try values.decodeIfPresent(String.self, forKey: .best_category)
		best_make = try values.decodeIfPresent(String.self, forKey: .best_make)
		best_model = try values.decodeIfPresent(String.self, forKey: .best_model)
		best_os = try values.decodeIfPresent(String.self, forKey: .best_os)
		recog_rank = try values.decodeIfPresent(Int.self, forKey: .recog_rank)
		is_family = try values.decodeIfPresent(Bool.self, forKey: .is_family)
		best_name = try values.decodeIfPresent(String.self, forKey: .best_name)
		mac_address = try values.decodeIfPresent(String.self, forKey: .mac_address)
		vendor = try values.decodeIfPresent(String.self, forKey: .vendor)
		ip_addresses = try values.decodeIfPresent([String].self, forKey: .ip_addresses)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		first_seen_timestamp = try values.decodeIfPresent(String.self, forKey: .first_seen_timestamp)
		netbios = try values.decodeIfPresent(Netbios.self, forKey: .netbios)
		bonjour = try values.decodeIfPresent(Bonjour.self, forKey: .bonjour)
	}

}