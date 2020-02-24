class AddDefaultValueToCompleted < ActiveRecord::Migration[6.0]
  def change
    def up
    change_column_default :orders, :completed, true
    end

    def down
    change_column_default :orders, :completed, nil
    end

  end
end
