//  This file was automatically generated and should not be edited.

import Apollo

public final class QueryQuery: GraphQLQuery {
  public static let operationString =
    "query Query {\n  collections {\n    __typename\n    id\n    name\n    items {\n      __typename\n      id\n      name {\n        __typename\n        en\n        th\n      }\n      scientificName\n      information\n      figures {\n        __typename\n        image\n        description\n        reference\n      }\n      room {\n        __typename\n        name\n      }\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("collections", type: .nonNull(.list(.nonNull(.object(Collection.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(collections: [Collection]) {
      self.init(snapshot: ["__typename": "Query", "collections": collections.map { $0.snapshot }])
    }

    public var collections: [Collection] {
      get {
        return (snapshot["collections"] as! [Snapshot]).map { Collection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "collections")
      }
    }

    public struct Collection: GraphQLSelectionSet {
      public static let possibleTypes = ["Collection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, items: [Item]) {
        self.init(snapshot: ["__typename": "Collection", "id": id, "name": name, "items": items.map { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Item"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .object(Name.selections)),
          GraphQLField("scientificName", type: .scalar(String.self)),
          GraphQLField("information", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("figures", type: .nonNull(.list(.nonNull(.object(Figure.selections))))),
          GraphQLField("room", type: .object(Room.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: Name? = nil, scientificName: String? = nil, information: [String], figures: [Figure], room: Room? = nil) {
          self.init(snapshot: ["__typename": "Item", "id": id, "name": name.flatMap { $0.snapshot }, "scientificName": scientificName, "information": information, "figures": figures.map { $0.snapshot }, "room": room.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: Name? {
          get {
            return (snapshot["name"] as? Snapshot).flatMap { Name(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "name")
          }
        }

        public var scientificName: String? {
          get {
            return snapshot["scientificName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "scientificName")
          }
        }

        public var information: [String] {
          get {
            return snapshot["information"]! as! [String]
          }
          set {
            snapshot.updateValue(newValue, forKey: "information")
          }
        }

        public var figures: [Figure] {
          get {
            return (snapshot["figures"] as! [Snapshot]).map { Figure(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "figures")
          }
        }

        public var room: Room? {
          get {
            return (snapshot["room"] as? Snapshot).flatMap { Room(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "room")
          }
        }

        public struct Name: GraphQLSelectionSet {
          public static let possibleTypes = ["LocalizedString"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("en", type: .scalar(String.self)),
            GraphQLField("th", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(en: String? = nil, th: String? = nil) {
            self.init(snapshot: ["__typename": "LocalizedString", "en": en, "th": th])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var en: String? {
            get {
              return snapshot["en"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "en")
            }
          }

          public var th: String? {
            get {
              return snapshot["th"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "th")
            }
          }
        }

        public struct Figure: GraphQLSelectionSet {
          public static let possibleTypes = ["Figure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("reference", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(image: String? = nil, description: String? = nil, reference: String? = nil) {
            self.init(snapshot: ["__typename": "Figure", "image": image, "description": description, "reference": reference])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var description: String? {
            get {
              return snapshot["description"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          public var reference: String? {
            get {
              return snapshot["reference"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "reference")
            }
          }
        }

        public struct Room: GraphQLSelectionSet {
          public static let possibleTypes = ["Room"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil) {
            self.init(snapshot: ["__typename": "Room", "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class QrCodeQuery: GraphQLQuery {
  public static let operationString =
    "query QrCode($id: ID!) {\n  trail(id: $id) {\n    __typename\n    name\n    id\n    quests {\n      __typename\n      name\n      introduction\n      summary\n      objectives {\n        __typename\n        name\n        targets {\n          __typename\n          hint\n          introduction\n          summary\n          item {\n            __typename\n            id\n            name {\n              __typename\n              en\n              th\n            }\n            scientificName\n            information\n            figures {\n              __typename\n              image\n              description\n              reference\n            }\n            room {\n              __typename\n              name\n            }\n          }\n        }\n      }\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("trail", arguments: ["id": GraphQLVariable("id")], type: .object(Trail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(trail: Trail? = nil) {
      self.init(snapshot: ["__typename": "Query", "trail": trail.flatMap { $0.snapshot }])
    }

    public var trail: Trail? {
      get {
        return (snapshot["trail"] as? Snapshot).flatMap { Trail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "trail")
      }
    }

    public struct Trail: GraphQLSelectionSet {
      public static let possibleTypes = ["Trail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("quests", type: .nonNull(.list(.nonNull(.object(Quest.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String? = nil, id: GraphQLID, quests: [Quest]) {
        self.init(snapshot: ["__typename": "Trail", "name": name, "id": id, "quests": quests.map { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var quests: [Quest] {
        get {
          return (snapshot["quests"] as! [Snapshot]).map { Quest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "quests")
        }
      }

      public struct Quest: GraphQLSelectionSet {
        public static let possibleTypes = ["Quest"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("introduction", type: .scalar(String.self)),
          GraphQLField("summary", type: .scalar(String.self)),
          GraphQLField("objectives", type: .nonNull(.list(.nonNull(.object(Objective.selections))))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String? = nil, introduction: String? = nil, summary: String? = nil, objectives: [Objective]) {
          self.init(snapshot: ["__typename": "Quest", "name": name, "introduction": introduction, "summary": summary, "objectives": objectives.map { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var introduction: String? {
          get {
            return snapshot["introduction"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "introduction")
          }
        }

        public var summary: String? {
          get {
            return snapshot["summary"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "summary")
          }
        }

        public var objectives: [Objective] {
          get {
            return (snapshot["objectives"] as! [Snapshot]).map { Objective(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "objectives")
          }
        }

        public struct Objective: GraphQLSelectionSet {
          public static let possibleTypes = ["Objective"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("targets", type: .nonNull(.list(.nonNull(.object(Target.selections))))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil, targets: [Target]) {
            self.init(snapshot: ["__typename": "Objective", "name": name, "targets": targets.map { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var targets: [Target] {
            get {
              return (snapshot["targets"] as! [Snapshot]).map { Target(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "targets")
            }
          }

          public struct Target: GraphQLSelectionSet {
            public static let possibleTypes = ["Target"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("hint", type: .scalar(String.self)),
              GraphQLField("introduction", type: .scalar(String.self)),
              GraphQLField("summary", type: .scalar(String.self)),
              GraphQLField("item", type: .nonNull(.object(Item.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(hint: String? = nil, introduction: String? = nil, summary: String? = nil, item: Item) {
              self.init(snapshot: ["__typename": "Target", "hint": hint, "introduction": introduction, "summary": summary, "item": item.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var hint: String? {
              get {
                return snapshot["hint"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "hint")
              }
            }

            public var introduction: String? {
              get {
                return snapshot["introduction"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "introduction")
              }
            }

            public var summary: String? {
              get {
                return snapshot["summary"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "summary")
              }
            }

            public var item: Item {
              get {
                return Item(snapshot: snapshot["item"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "item")
              }
            }

            public struct Item: GraphQLSelectionSet {
              public static let possibleTypes = ["Item"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .object(Name.selections)),
                GraphQLField("scientificName", type: .scalar(String.self)),
                GraphQLField("information", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
                GraphQLField("figures", type: .nonNull(.list(.nonNull(.object(Figure.selections))))),
                GraphQLField("room", type: .object(Room.selections)),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, name: Name? = nil, scientificName: String? = nil, information: [String], figures: [Figure], room: Room? = nil) {
                self.init(snapshot: ["__typename": "Item", "id": id, "name": name.flatMap { $0.snapshot }, "scientificName": scientificName, "information": information, "figures": figures.map { $0.snapshot }, "room": room.flatMap { $0.snapshot }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              public var name: Name? {
                get {
                  return (snapshot["name"] as? Snapshot).flatMap { Name(snapshot: $0) }
                }
                set {
                  snapshot.updateValue(newValue?.snapshot, forKey: "name")
                }
              }

              public var scientificName: String? {
                get {
                  return snapshot["scientificName"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "scientificName")
                }
              }

              public var information: [String] {
                get {
                  return snapshot["information"]! as! [String]
                }
                set {
                  snapshot.updateValue(newValue, forKey: "information")
                }
              }

              public var figures: [Figure] {
                get {
                  return (snapshot["figures"] as! [Snapshot]).map { Figure(snapshot: $0) }
                }
                set {
                  snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "figures")
                }
              }

              public var room: Room? {
                get {
                  return (snapshot["room"] as? Snapshot).flatMap { Room(snapshot: $0) }
                }
                set {
                  snapshot.updateValue(newValue?.snapshot, forKey: "room")
                }
              }

              public struct Name: GraphQLSelectionSet {
                public static let possibleTypes = ["LocalizedString"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("en", type: .scalar(String.self)),
                  GraphQLField("th", type: .scalar(String.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(en: String? = nil, th: String? = nil) {
                  self.init(snapshot: ["__typename": "LocalizedString", "en": en, "th": th])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var en: String? {
                  get {
                    return snapshot["en"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "en")
                  }
                }

                public var th: String? {
                  get {
                    return snapshot["th"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "th")
                  }
                }
              }

              public struct Figure: GraphQLSelectionSet {
                public static let possibleTypes = ["Figure"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("image", type: .scalar(String.self)),
                  GraphQLField("description", type: .scalar(String.self)),
                  GraphQLField("reference", type: .scalar(String.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(image: String? = nil, description: String? = nil, reference: String? = nil) {
                  self.init(snapshot: ["__typename": "Figure", "image": image, "description": description, "reference": reference])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var image: String? {
                  get {
                    return snapshot["image"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "image")
                  }
                }

                public var description: String? {
                  get {
                    return snapshot["description"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "description")
                  }
                }

                public var reference: String? {
                  get {
                    return snapshot["reference"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "reference")
                  }
                }
              }

              public struct Room: GraphQLSelectionSet {
                public static let possibleTypes = ["Room"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .scalar(String.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(name: String? = nil) {
                  self.init(snapshot: ["__typename": "Room", "name": name])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String? {
                  get {
                    return snapshot["name"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}