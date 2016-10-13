class AddCachedVotesToPosts < ActiveRecord::Migration[5.0]
  def self.up
    add_column :goals, :cached_votes_total, :integer, :default => 0
    add_column :goals, :cached_votes_score, :integer, :default => 0
    add_column :goals, :cached_votes_up, :integer, :default => 0
    add_column :goals, :cached_votes_down, :integer, :default => 0
    add_column :goals, :cached_weighted_score, :integer, :default => 0
    add_column :goals, :cached_weighted_total, :integer, :default => 0
    add_column :goals, :cached_weighted_average, :float, :default => 0.0
    add_index  :goals, :cached_votes_total
    add_index  :goals, :cached_votes_score
    add_index  :goals, :cached_votes_up
    add_index  :goals, :cached_votes_down
    add_index  :goals, :cached_weighted_score
    add_index  :goals, :cached_weighted_total
    add_index  :goals, :cached_weighted_average
    Goal.find_each(&:update_cached_votes)
  end
  def self.down
    remove_column :goals, :cached_votes_total
    remove_column :goals, :cached_votes_score
    remove_column :goals, :cached_votes_up
    remove_column :goals, :cached_votes_down
    remove_column :goals, :cached_weighted_score
    remove_column :goals, :cached_weighted_total
    remove_column :goals, :cached_weighted_average
  end
end
