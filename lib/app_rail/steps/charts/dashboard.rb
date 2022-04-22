# frozen_string_literal: true

module AppRail
  module Steps
    module Charts
      module Dashboard
        def ar_charts_dashboard_statistic(id:, title:, text:)
          {
            id: id.to_s,
            chartType: :statistic,
            title: title,
            text: text
          }.compact
        end

        def ar_charts_dashboard_line_chart(id:, title:, values:, text: nil, footer: nil)
          {
            id: id.to_s,
            chartType: :line,
            title: title,
            text: text,
            footer: footer,
            chartValues: values
          }.compact
        end

        def ar_charts_dashboard_bar_chart(id:, title:, values:)
          {
            id: id.to_s,
            chartType: :bar,
            title: title,
            chartValues: values
          }.compact
        end

        def ar_charts_dashboard_bar_pie(id:, title:, values:, light_colors: nil, dark_colors: nil)
          {
            id: id.to_s,
            chartType: :pie,
            title: title,
            chartValues: values,
            chartColors: light_colors,
            chartColorsDark: dark_colors
          }.compact
        end
      end
    end
  end
end
