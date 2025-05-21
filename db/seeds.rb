# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create sample exercises
[
  { name: 'barbell back squat', category: 'lower body' },
  { name: 'barbell front squat', category: 'lower body' },
  { name: 'zercher squat', category: 'lower body' },
  { name: 'barbell deadlift', category: 'lower body' },
  { name: 'barbell romanian deadlift', category: 'lower body' },
  { name: 'barbell lunge', category: 'lower body' },
  { name: 'barbell bench press', category: 'upper body' },
  { name: 'barbell military press', category: 'upper body' },
  { name: 'pull up', category: 'upper body' },
  { name: 'chin up', category: 'upper body' },
  { name: 'dumbbell bench press', category: 'upper body' },
  { name: 'dumbbell shoulder press', category: 'upper body' },
  { name: 'barbell bent over row', category: 'upper body' },
  { name: 'barbell curl', category: 'upper body' },
  { name: 'skull crusher', category: 'upper body' }
].each do |exercise_name|
  Exercise.find_or_create_by!(name: exercise_name[:name]) do |exercise|
    exercise.category = exercise_name[:category]
  end
end

# Create sample workouts
Exercise.all.pluck(:category).uniq.each do |category|
  Workout.create!(name: "#{category.capitalize} workout") do |workout|
    4.times do
      workout.exercise_sets.build(
        exercise: Exercise.where(category: category).sample,
        reps: rand(5..15),
        weight: rand(50..200),
        rest_time: rand(30..90),
        perceived_exertion: rand(1..10)
      )
    end
  end
end
