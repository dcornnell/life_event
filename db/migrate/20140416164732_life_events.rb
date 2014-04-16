class LifeEvents < ActiveRecord::Migration
  def change
  	create_table :life_events do |t|
  		t.string :description
  		t.string :location
  		t.date 	 :date
		end
  end
end
