class AdditionalColumns < ActiveRecord::Migration
  def change
    add_column :bands, :genre, :string
    add_column :bands, :rate, :integer
    add_column :bands, :rating_ct, :integer
    add_column :bands, :review, :string
    add_column :bands, :biography, :string
    add_column :bands, :established_date, :string
  end
end
