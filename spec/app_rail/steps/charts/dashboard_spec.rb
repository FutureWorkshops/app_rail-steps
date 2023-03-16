# frozen_string_literal: true

RSpec.describe AppRail::Steps::Charts::Dashboard do
  subject { test_struct.new(id) }

  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  describe "#ar_charts_dashboard_statistic" do
    context "required" do
      let(:result) { subject.ar_charts_dashboard_statistic(id: 1, title: "London", text: "10,000,000") }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:chartType]).to eq :statistic }
      it { expect(result[:title]).to eq "London" }
      it { expect(result[:text]).to eq "10,000,000" }
    end
  end

  describe "#ar_charts_dashboard_line_chart" do
    context "required" do
      let(:result) { subject.ar_charts_dashboard_line_chart(id: 1, title: "London", values: [1, 2, 3]) }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:chartType]).to eq :line }
      it { expect(result[:title]).to eq "London" }
      it { expect(result[:chartValues]).to eq [1, 2, 3] }
    end
  end

  describe "#ar_charts_dashboard_bar_chart" do
    context "required" do
      let(:result) { subject.ar_charts_dashboard_bar_chart(id: 1, title: "London", values: [1, 2, 3]) }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:chartType]).to eq :bar }
      it { expect(result[:title]).to eq "London" }
      it { expect(result[:chartValues]).to eq [1, 2, 3] }
    end
  end

  describe "#ar_charts_dashboard_bar_pie" do
    context "required" do
      let(:result) { subject.ar_charts_dashboard_bar_pie(id: 1, title: "London", values: [1, 2, 3]) }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:chartType]).to eq :pie }
      it { expect(result[:title]).to eq "London" }
      it { expect(result[:chartValues]).to eq [1, 2, 3] }
    end
  end
end
