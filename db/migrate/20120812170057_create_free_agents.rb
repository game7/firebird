class CreateFreeAgents < ActiveRecord::Migration
  def self.up
    create_table :free_agents do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :free_agents
  end
end
