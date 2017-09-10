class AddGitHubIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :GithubId, :string
  end
end
