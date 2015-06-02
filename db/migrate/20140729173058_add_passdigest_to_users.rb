# -*- encoding : utf-8 -*-
class AddPassdigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
  end
end
