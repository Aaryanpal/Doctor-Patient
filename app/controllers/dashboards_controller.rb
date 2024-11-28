class DashboardsController < ApplicationController
  layout 'layouts/dashboard'
  # TODO add a way to organize this code in helper and insure to use restfull resource
  def index
    if @dashboard_view == 'doctor_dashboard'
      chart_data_vaiue
      render 'dashboards/doctor_dashboard'
    elsif @dashboard_view == 'receptionist_dashboard'
      render 'dashboards/receptionist_dashboard'
    else
      redirect_to root_path, alert: 'Unauthorized access!'
    end
  end
  private

  def chart_data_vaiue
    obj = Patient.pluck(:created_at).uniq.map{|i| i.to_date.to_s}
    @chart_data = {
      labels: obj.uniq,
      datasets: [{
        label: 'Monthly Data',
        backgroundColor: 'transparent',
        borderColor: '#3B82F6',
        data: obj.tally.values
      }]
    }
    @chart_options = {
      responsive: true,
      maintainAspectRatio: false,
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
    }

    @chart_circle_data = {
      labels: [
        'Red',
        'Blue',
        'Yellow'
      ],
      datasets: [{
        label: 'My First Dataset',
        data: [300, 50, 100],
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)'
        ],
        hoverOffset: 4
      }]
    };
    @chart_circle_options =  {
      responsive: true
    };
  end
end