require 'budget_service'

RSpec.describe BudgetService, "#query" do

  context "when query whole month" do
    it "should return 310" do
      set_budgets([{year_month: '202401', amount: 310}])
      expect(query_budget('20240101', '20240131')).to eq 310
    end
  end

  context "when query single date of a month" do
    it "should return 10" do
      set_budgets([{year_month: '202401', amount: 310}])
      expect(query_budget('20240101', '20240101')).to eq 10
    end
  end

  context "when query cross months" do
    it "should return " do
      set_budgets([
        {year_month: '202401', amount: 310},
        {year_month: '202402', amount: 2900}
      ])
      expect(query_budget('20240130', '20240205')).to eq 520
    end
  end

  context "when query start greater than end" do
    it "should return 0" do
      set_budgets([
        {year_month: '202401', amount: 310},
        {year_month: '202402', amount: 2900}
      ])
      expect(query_budget('20240131', '20240101')).to eq 0
    end
  end

  context "when query out of range" do
    it "should return 0" do
      set_budgets([
        {year_month: '202401', amount: 310}
      ])
      expect(query_budget('20240201', '20240201')).to eq 0
    end
  end

  context "when query cross several months" do
    it "should return 3020" do
      set_budgets([
        {year_month: '202312', amount: 310},
        {year_month: '202402', amount: 2900},
        {year_month: '202403', amount: 620}
      ])
      expect(query_budget('20231230', '20240305')).to eq 3020
    end
  end
end

def set_budgets(budgets)
  allow(BudgetRepo).to receive(:get_all).and_return(budgets.map{ |b|
    Budget.new(b[:year_month], b[:amount])
  })
end

def query_budget(start_date, end_date)
  BudgetService.new.query(start_date, end_date)
end
