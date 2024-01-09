class RemovePrivacySettingFromDreams < ActiveRecord::Migration[7.0]
  def change
    remove_column :dreams, :privacy_setting
  end
end
