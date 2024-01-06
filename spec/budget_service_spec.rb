require 'budget_service'
require 'budget_repo'

# 1. 查整個月
# 2. 查單一天
# 3. 查跨月
# 4. 起日大餘迄日
# 5. 沒有資料
# 6. 跨 3 個月，其中一個月沒資料


RSpec.describe BudgetService, "#amount" do

  context "when query whole month" do
    it "should return 310" do
      budget_repo = double
      # BudgetService.new(budget_repo)
      allow(budget_repo).to receive(:getAll).and_return([
        Budget.new('202401', 310)
      ])
      # expect(budget_repo.getAll).to eq 310
      expect(BudgetService.new(budget_repo).query('2024010101', '20240131')).to eq 310
    end
  end
end
