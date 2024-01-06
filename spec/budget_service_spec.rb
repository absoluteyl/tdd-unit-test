require 'budget_service'

RSpec.describe BudgetService, "#query" do

  context "when query whole month" do
    it "should return 310" do
      set_budgets([{yearMonth: '202401', amount: 310}])
      expect(query_budget('20240101', '20240131')).to eq 310
    end
  end

  context "when query single date of a month" do
    it "should return 10" do
      set_budgets([{yearMonth: '202401', amount: 310}])
      expect(query_budget('20240101', '20240101')).to eq 10
    end
  end

  context "when query cross months" do
    it "should return " do
      set_budgets([
        {yearMonth: '202401', amount: 310},
        {yearMonth: '202402', amount: 2900}
      ])
      expect(query_budget('20240130', '20240205')).to eq 520
    end
  end

  context "when query start greater than end" do
    it "should return 0" do
      set_budgets([
        {yearMonth: '202401', amount: 310},
        {yearMonth: '202402', amount: 2900}
      ])
      expect(query_budget('20240131', '20240101')).to eq 0
    end
  end
end

def set_budgets(budgets)
  @budget_repo = double
  allow(@budget_repo).to receive(:getAll).and_return(budgets.map{ |b|
    Budget.new(b[:yearMonth], b[:amount])
  })
end

def query_budget(start_date, end_date)
  BudgetService.new(@budget_repo).query(start_date, end_date)
end
