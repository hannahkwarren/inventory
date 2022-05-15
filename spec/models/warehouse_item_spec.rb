# spec/models/warehouse_item_spec.rb

RSpec.describe WarehouseItem, type: :model do
  describe 'relationships' do
    it { should belong_to(:warehouse) }
    it { should belong_to(:item) }
  end

  describe 'validations' do
    it { should validate_presence_of(:aisle) }
    it { should validate_presence_of(:quantity) }
  end
end
