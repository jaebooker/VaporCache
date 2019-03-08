import FluentSQLite
import Vapor

/// A single entry of a Cache list.
final class Cache: SQLiteModel {
    /// The unique identifier for this Cache
    var id: Int?
    var notes: [String]
    var xcoordinate: Double
    var ycoordinate: Double
    /// Creates a new Cache
    init(id: Int? = nil, notes: [String], xcoordinate: Double, ycoordinate: Double) {
        self.id = id
        self.notes = notes
        self.xcoordinate = xcoordinate
        self.ycoordinate = ycoordinate
    }
}

/// Allows Cache to be used as a dynamic migration.
extension Cache: Migration { }

/// Allows Cache to be encoded to and decoded from HTTP messages.
extension Cache: Content { }

/// Allows Cache to be used as a dynamic parameter in route definitions.
extension Cache: Parameter { }
