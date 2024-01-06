require 'budget_service'

# 1. 查整個月
# 2. 查單一天
# 3. 查跨月
# 4. 起日大餘迄日
# 5. 沒有資料
# 6. 跨 3 個月，其中一個月沒資料

RSpec.describe BudgetService, "#amount" do
  context "when game start" do
    it "should return love all" do
      budgetService = BudgetService.new
      budgetService.getAll = ()=>{
        Budget.new('202004',300),
      }

end
