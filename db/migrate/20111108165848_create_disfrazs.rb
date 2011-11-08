class CreateDisfrazs < ActiveRecord::Migration
  def change
    create_table :disfrazs do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
