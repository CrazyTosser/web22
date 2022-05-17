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
  "ALTER SEQUENCE #{Framework.table_name}_id_seq RESTART WITH 1"
)
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE #{Value.table_name}_id_seq RESTART WITH 1"
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

User.delete_all
User.create!([
               { name: 'example', email: 'test@test.tt', password_digest: BCrypt::Password.create("123456").to_s },
               { name: 'example2', email: 'test2@test.tt', password_digest: BCrypt::Password.create("123456").to_s }
             ])

Framework.delete_all
Framework.create!([
               { name: '123', description: '321', file: '', theme_id: 2, user_id: 1 },
               { name: '321', description: '123', file: '', theme_id: 2, user_id: 2 },
               { name: '111', description: '321', file: '', theme_id: 3, user_id: 1 }
             ])

Value.delete_all
Value.create!([
                {value: 4, user_id: 1, framework_id: 1}
              ])


