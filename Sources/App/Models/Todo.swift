import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Todo: SQLiteModel {
    /// The unique identifier for this `Todo`.
    var id: Int?

    /// A title describing what this `Todo` entails.
    var notes: [String]
    var xcoordinate: Float
    var ycoordinate: Float
    /// Creates a new `Todo`.
    init(id: Int? = nil, notes: [String], xcoordinate: Float, ycoordinate: Float) {
        self.id = id
        self.notes = notes
        self.xcoordinate = xcoordinate
        self.ycoordinate = ycoordinate
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Todo: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Todo: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Todo: Parameter { }
