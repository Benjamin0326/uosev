class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|

      t.timestamps null: false

      t.integer  :subject_no
			t.string   :subject_nm
			t.integer  :class_div
			t.string   :subject_div
			t.string   :dept
			t.integer  :credit
			t.string   :prof_nm
    end
  end
end
