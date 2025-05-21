class AddWeightAndRestToExerciseSets < ActiveRecord::Migration[8.0]
  def change
    add_column :exercise_sets, :weight, :float
    add_column :exercise_sets, :rest_time, :integer
  end
end
