require 'budget_service'

# 1. 查整個月
# 2. 查單一天
# 3. 查跨月
# 4. 起日大餘迄日
# 5. 沒有資料
# 6. 跨 3 個月，其中一個月沒資料


RSpec.describe BudgetService, "#query" do

  context "when query whole month" do
    it "should return 310" do
      budget_repo = double
      allow(budget_repo).to receive(:getAll).and_return([
        Budget.new('202401', 310)
      ])
      expect(BudgetService.new(budget_repo).query('2024010101', '20240131')).to eq 310
    end
  end

  context "when query single date of a month" do
    it "should return 10" do
      budget_repo = double
      allow(budget_repo).to receive(:getAll).and_return([
        Budget.new('202401', 310)
      ])
      expect(BudgetService.new(budget_repo).query('2024010101', '2024010101')).to eq 10
    end
  end

  context "when query cross months" do
    it "should return " do
      budget_repo = double
      allow(budget_repo).to receive(:getAll).and_return([
        Budget.new('202401', 310),
        Budget.new('202402', 2900)
      ])
      expect(BudgetService.new(budget_repo).query('20240130', '20240205')).to eq 520
    end
  end
end
