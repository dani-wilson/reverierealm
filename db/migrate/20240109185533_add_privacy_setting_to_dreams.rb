class AddPrivacySettingToDreams < ActiveRecord::Migration[7.0]
  def change
    add_column :dreams, :privacy_setting, :boolean, default: false
  end
end
