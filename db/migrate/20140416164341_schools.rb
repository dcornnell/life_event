class Schools < ActiveRecord::Migration
  def change
  	create_table :schools do |t|
  		t.string :name
  		t.string :location
  		t.date 	 :graduation_date
		end
  end
end
