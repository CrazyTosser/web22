# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE #{Theme.table_name}_id_seq RESTART WITH 1"
)
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE #{Image.table_name}_id_seq RESTART WITH 1"
)
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE #{User.table_name}_id_seq RESTART WITH 1"
)

Theme.delete_all
Theme.create!([
                { name: '----' },
                { name: 'test' },
                { name: 'tst' }
              ])

Image.delete_all
Image.create!([
               { name: '123', file: '123', theme_id: 2 },
               { name: '321', file: '321', theme_id: 2 },
               { name: '111', file: '111', theme_id: 3 }
             ])

User.delete_all
User.create!([
              { name: 'example', email: '123' }
            ])
